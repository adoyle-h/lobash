# ---
# Category: Lobash
# Since: 0.1.0
# Usage: l.import [-f|--force] <module_name1> <module_nameN> [prefix=l.]
# ---

_lobash_dirname() {
  printf '%s\n' "${1%/*}"
}

_lobash_load_internal_consts() {
  local src_dir
  if [[ -n ${IS_LOBASH_TEST:-} ]]; then
    src_dir="$LOBASH_ROOT_DIR/src"
  else
    src_dir="$(_lobash_dirname "${BASH_SOURCE[0]}")/.."
  fi

  source "$src_dir"/internals/consts.bash
}

_lobash_import_internal() {
  local src_dir
  if [[ -n ${IS_LOBASH_TEST:-} ]]; then
    src_dir="$LOBASH_ROOT_DIR/src"
  else
    src_dir="$(_lobash_dirname "${BASH_SOURCE[0]}")/.."
  fi

  local module_path
  module_path="$src_dir/internals/$1.bash"

  eval "$(sed -E "s/^([A-Za-z0-9]\\w*)\\(\\) ?\\{$/${_LOBASH_INTERNAL_FUNC_PREFIX}\\1\\(\\) \\{/g" < "$module_path")"
}

_lobash_import_internals() {
  local name
  for name in "$@"; do
    _lobash_import_internal "$name"
  done
}

_lobash_load_internal_consts
_lobash_import_internals debug warn error

# ------------------------ internal functions above ---------------------------

# Usage: _l.get_module_path module_name
_l.get_module_path() {
  if [[ -z ${IS_LOBASH_TEST:-} ]]; then
    printf '%s\n' "$(_lobash_dirname "${BASH_SOURCE[0]}")/$1.bash"
  else
    printf '%s\n' "$LOBASH_ROOT_DIR/src/modules/$1.bash"
  fi
}

_l.import_deps() {
  local module_path=$1
  local prefix=$2

  # Get list of dependent modules names
  read -ra deps <<< "$( sed -n '/^# ---$/,/^# ---$/p' < "$module_path" \
    | grep '^# Dependent:' \
    | sed -E 's/^# Dependent: ?(.*)/\1/;s/,/ /g' \
    || true )"

  _lobash_debug "To load deps modules. deps.size=${#deps[*]}"
  if [[ ${#deps[@]} -gt 0 ]]; then
    for dep in "${deps[@]}"; do
      _l.import "$dep" "$prefix" false
    done
  fi
}

_l.import() {
  local module_name=$1
  local prefix=$2
  local is_force=$3

  _lobash_debug "S1. To load module. name=${module_name} prefix=${prefix}"

  [[ -z $module_name ]] && _lobash_error "Module name cannot be empty string." && return 3

  # Associative array only allow [a-zA-Z0-9_] for key naming
  local import_key=_lobash_import_cache_"${prefix//[^a-zA-Z0-9]/_}_${module_name//[^a-zA-Z0-9]/_}"
  if [[ $is_force == false ]] && [[ "${!import_key:-}" == loaded ]]; then
    _lobash_debug "import_key=${import_key} is loaded. skip load"
    return;
  else
    # To load module source code
    local module_path
    module_path=$(_l.get_module_path "$module_name")
    _lobash_debug "S2. module_name=${module_name} module_path=${module_path}"
    [[ ! -f $module_path ]] && _lobash_error "Not found module '${module_name}'." && return 4

    _l.import_deps "$module_path" "$prefix"

    _lobash_debug "S5. To load the source code of main module. module_path=$module_path"
    source "$module_path"

    read -r "$import_key" <<< 'loaded'
  fi

  _lobash_debug "S6. To set export name of main module."
  if [[ -n $prefix ]] \
    && [[ $prefix != "$_LOBASH_DEFAULT_PREFIX" ]] \
    && [[ $(type -t "${prefix}${module_name}") != function ]]; then
    # source <(echo "$prefix() { l.$module_name \"\$@\"; }")
    eval "${prefix}${module_name}() { ${_LOBASH_DEFAULT_PREFIX}${module_name} \"\$@\"; }"
  fi

  _lobash_debug "Loaded module. import_key=${import_key}"
}

_l.is_valid_lobash_prefix() {
  local prefix=$1

  [[ ${prefix%%.}. == "$prefix" ]] && return 0
  [[ ${prefix%%-}- == "$prefix" ]] && return 0
  [[ ${prefix%%_}_ == "$prefix" ]] && return 0

  return 1
}

_l.imports() {
  local is_force=false
  if [[ ${1:-} == '-f' ]] || [[ ${1:-} == '--force' ]]; then
    shift
    is_force=true
  fi

  local args=( "$@" )
  local args_len=${#args[@]}
  declare -a names
  local prefix

  if [[ $args_len -eq 0 ]]; then
    _lobash_error "Not found any parameters passed to import function."
    return 2
  elif [[ $args_len -eq 1 ]]; then
    names=( "${args[@]}" )
    prefix=$_LOBASH_DEFAULT_PREFIX
  else
    prefix="${args[*]: -1:1}"

    if _l.is_valid_lobash_prefix "$prefix"; then
      names=( "${args[@]:0:$args_len-1}" )
    else
      names=( "${args[@]}" )
      prefix=$_LOBASH_DEFAULT_PREFIX
    fi
  fi

  _lobash_debug names="${names[*]}" prefix="${prefix}"

  local name
  for name in "${names[@]}"; do
    _l.import "$name" "$prefix" $is_force
  done
}

# For replace custom prefix of public method. Private method name never changed.
import() {
  _l.imports "$@"
}
