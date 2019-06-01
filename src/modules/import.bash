# ---
# Category: Core
# Since: 0.1.0
# ---

_l.load_consts_in_dynamic_source() {
  local src_dir
  if [[ -n $IS_LOBASH_TEST ]]; then
    src_dir="$LOBASH_ROOT_DIR/src"
  else
    src_dir="$(dirname "${BASH_SOURCE[0]}")/.."
  fi

  source "$src_dir"/internals/consts.bash
}

_l.import_internal() {
  local src_dir
  if [[ -n $IS_LOBASH_TEST ]]; then
    src_dir="$LOBASH_ROOT_DIR/src"
  else
    src_dir="$(dirname "${BASH_SOURCE[0]}")/.."
  fi

  local module_path
  module_path="$src_dir/internals/$1.bash"

  # source <( sed -E "s/^([A-Za-z0-9]\\w*)\\(\\) ?\\{$/${_LOBASH_INTERNAL_FUNC_PREFIX}\\1\\(\\) \\{/g" < "$module_path" )
  eval "$(sed -E "s/^([A-Za-z0-9]\\w*)\\(\\) ?\\{$/${_LOBASH_INTERNAL_FUNC_PREFIX}\\1\\(\\) \\{/g" < "$module_path")"
}

_l.import_internals() {
  local name
  for name in "$@"; do
    _l.import_internal "$name"
  done
}

_l.load_consts_in_dynamic_source
_l.import_internals debug warn error

#--------------------------------------------

# Usage: _l.get_module_path module_name
_l.get_module_path() {
  if [[ -n $IS_LOBASH_TEST ]]; then
    echo "$LOBASH_ROOT_DIR/src/modules/$1.bash"
  else
    echo "$(dirname "${BASH_SOURCE[0]}")/$1.bash"
  fi
}

_l.get_module_meta_str() {
  local module_name=$1
  local module_path
  module_path=$(_l.get_module_path "$module_name")
  _lobash_debug "module_name=${module_name} module_path=${module_path}"
  head -n "$_LOBASH_METADATA_MAX_LINES" "$module_path" | sed -n '/^# ---$/,/^# ---$/p' | sed '1d;$d;s/^# //'
}

_l.load_module_file() {
  local module_path=$1
  local prefix=$2
  local module_name=$3

  source "$module_path"

  if [[ -n $prefix ]] && [[ $prefix != "$_LOBASH_DEFAULT_PREFIX" ]]; then
    # source <(echo "$prefix() { l.$module_name \"\$@\"; }")
    eval "${prefix}${module_name}() { ${_LOBASH_DEFAULT_PREFIX}${module_name} \"\$@\"; }"
  fi
}

# @BUG The bug only appear in run_test.
# The associative array seems not an associative array and cannot be modified by function scope.
# _lobash_import_cache[any key] will be 'loaded' after _lobash_import_cache[import]=loaded
# It makes the test cases failed.
# declare -A _lobash_import_cache

_l.import() {
  local module_name=$1
  local prefix=$2

  _lobash_debug "S1. To load module_name=${module_name} prefix=${prefix}"

  [[ -z $module_name ]] && _lobash_error "Module name cannot be empty string." && return 3

  # Associative array only allow [a-zA-Z0-9_] for key naming
  local import_key=_lobash_import_cache_"${prefix//[^a-zA-Z0-9]/_}_${module_name//[^a-zA-Z0-9]/_}"
  if [[ "${!import_key:-}" == loaded ]]; then
    _lobash_debug "import_key=${import_key} is loaded. skip load"
    return;
  fi

  local module_path
  module_path=$(_l.get_module_path "$module_name")
  _lobash_debug "S2. To load module. name=${module_name} module_path=${module_path}"

  [[ ! -f $module_path ]] && _lobash_error "Not found module '${module_name}'." && return 4

  local meta_str
  declare -a meta_deps
  meta_str="$(_l.get_module_meta_str "$module_name")"
  _lobash_debug "meta_str=${meta_str}"

  meta_deps=( $( echo "$meta_str" | grep '^Dependent:' | sed -E 's/^Dependent: ?(.*)/\1/;s/,/ /g' || [[ $? != 0 ]] ) )

  # _lobash_debug "import_key=${import_key}"
  _lobash_debug "To load module_path=${module_path} meta_deps=${meta_deps[*]} len=${#meta_deps[*]}"

  if [[ ${#meta_deps[@]} -gt 0 ]]; then
    local dep
    for dep in "${meta_deps[@]}"; do
      _lobash_debug "S4.1. To load dep module=$dep"
      _l.import "$dep" "$prefix"
      _lobash_debug "S4.2. Loaded dep module=$dep"
    done
  fi

  _lobash_debug "S5. To load main module. module_path=$module_path"

  _l.load_module_file "$module_path" "$prefix" "$module_name"

  read -r "$import_key" <<< 'loaded'

  _lobash_debug "Loaded import_key=${import_key}"
}

# _l.ends_with() {
#   if [[ ${1%%"$2"}$2 == "$1" ]]; then
#     echo true
#   else
#     echo false
#   fi
# }

_l.is_valid_lobash_prefix() {
  local prefix=$1

  [[ ${prefix%%.}. == "$prefix" ]] && return 0
  [[ ${prefix%%-}- == "$prefix" ]] && return 0
  [[ ${prefix%%_}_ == "$prefix" ]] && return 0

  return 1
}

_l.imports() {
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
    _l.import "$name" "$prefix"
  done
}

# For replace custom prefix of public method. Private method name never changed.
import() {
  _l.imports "$@"
}
