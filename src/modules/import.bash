# ---
# Category: Core
# Since: 0.1.0
# ---

_lobash_load_consts_in_dynamic_source() {
  local src_dir
  if [[ -n $IS_LOBASH_TEST ]]; then
    src_dir="$LOBASH_ROOT_DIR/src"
  else
    src_dir="$(dirname "${BASH_SOURCE[0]}")/.."
  fi

  source "$src_dir"/internals/consts.bash
}

_lobash_import_internal() {
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

_lobash_import_internals() {
  local name
  for name in "$@"; do
    _lobash_import_internal "$name"
  done
}

_lobash_load_consts_in_dynamic_source
_lobash_import_internals debug warn error

#--------------------------------------------

# Usage: _lobash_get_module_path module_name
_lobash_get_module_path() {
  if [[ -n $IS_LOBASH_TEST ]]; then
    echo "$LOBASH_ROOT_DIR/src/modules/$1.bash"
  else
    echo "$(dirname "${BASH_SOURCE[0]}")/$1.bash"
  fi
}

_lobash_get_module_meta_str() {
  local module_name=$1
  local module_path
  module_path=$(_lobash_get_module_path "$module_name")
  _lobash_in_debug "module_name=${module_name} module_path=${module_path}"
  head -n "$_LOBASH_METADATA_MAX_LINES" "$module_path" | sed -n '/^# ---$/,/^# ---$/p' | sed '1d;$d;s/^# //'
}

# @TODO cache each import by import_key
# if [[ ! -v __lobash_imports ]]; then
#   declare -A __lobash_imports
#   _lobash_in_debug "new __lobash_imports=${!__lobash_imports[*]}"
# else
#   _lobash_ebug "use old __lobash_imports=${!__lobash_imports[*]}"
# fi

_lobash_load_module_file() {
  local module_path=$1
  local prefix=$2
  local module_name=$3

  # source <( sed -E "s/^$_LOBASH_PUBLIC_FUNC_PREFIX([A-Za-z0-9]\\w*)\\(\\) ?\\{$/${prefix}\\1\\(\\) \\{/g" < "$module_path" )
  source "$module_path"

  if [[ -n $prefix ]]; then
    # source <(echo "$prefix() { l.$module_name \"\$@\"; }")
    eval "$prefix$module_name() { l.$module_name \"\$@\"; }"
  fi
}

_lobash_import() {
  local module_name=$1
  local prefix=$2

  _lobash_in_debug "S1. To load module_name=${module_name} prefix=${prefix}"

  [[ -z $module_name ]] && _lobash_in_error "Module name cannot be empty string." && return 3

  # # Associative array only allow [a-zA-Z0-9_] for key naming
  # local import_key="${prefix//[^a-zA-Z0-9]/_}_${module_name}"
  # _lobash_in_debug "To load import_key=${import_key}, __lobash_imports=${!__lobash_imports[*]}"
  # if [[ "${__lobash_imports[$import_key]:-}" == loaded ]] ; then
  #   _lobash_in_debug "import_key=${import_key} is loaded. skip load"
  #   return;
  # fi

  local module_path
  module_path=$(_lobash_get_module_path "$module_name")
  _lobash_in_debug "S2. To load module. name=${module_name} module_path=${module_path}"

  [[ ! -f $module_path ]] && _lobash_in_error "Not found module '${module_name}'." && return 4

  local meta_str
  declare -a meta_deps
  meta_str="$(_lobash_get_module_meta_str "$module_name")"
  _lobash_in_debug "meta_str=${meta_str}"

  meta_deps=( $( echo "$meta_str" | grep '^Dependent:' | sed -E 's/^Dependent: ?(.*)/\1/;s/,/ /g' || [[ $? != 0 ]] ) )

  # _lobash_in_debug "import_key=${import_key}"
  _lobash_in_debug "To load module_path=${module_path} meta_deps=${meta_deps[*]} len=${#meta_deps[*]}"

  if [[ ${#meta_deps[@]} -gt 0 ]]; then
    local dep
    for dep in "${meta_deps[@]}"; do
      _lobash_in_debug "S4.1. To load dep module=$dep"
      _lobash_import "$dep" "$prefix"
      _lobash_in_debug "S4.2. Loaded dep module=$dep"
    done
  fi

  _lobash_in_debug "S5. To load main module. module_path=$module_path"

  _lobash_load_module_file "$module_path" "$prefix" "$module_name"

  # __lobash_imports[${import_key}]=loaded
  # _lobash_in_debug "Loaded import_key=${import_key}"
}

_lobash_ends_with() {
  if [[ ${1%%"$2"}$2 == "$1" ]]; then
    echo true
  else
    echo false
  fi
}

_lobash_is_valid_lobash_prefix() {
  local prefix=$1
  [[ $(_lobash_ends_with "$prefix" '.') == true ]] && return 0
  [[ $(_lobash_ends_with "$prefix" '-') == true ]] && return 0
  [[ $(_lobash_ends_with "$prefix" '_') == true ]] && return 0
  return 1
}

_lobash_imports() {
  local args=( "$@" )
  local args_len=${#args[@]}
  declare -a names
  local prefix

  if [[ $args_len -eq 0 ]]; then
    _lobash_in_error "Not found any parameters passed to import function."
    return 2
  elif [[ $args_len -eq 1 ]]; then
    names=( "${args[@]}" )
    prefix=$_LOBASH_DEFAULT_PREFIX
  else
    prefix="${args[*]: -1:1}"

    if _lobash_is_valid_lobash_prefix "$prefix"; then
      names=( "${args[@]:0:$args_len-1}" )
    else
      names=( "${args[@]}" )
      prefix=$_LOBASH_DEFAULT_PREFIX
    fi
  fi

  _lobash_in_debug names="${names[*]}" prefix="${prefix}"

  local name
  for name in "${names[@]}"; do
    _lobash_import "$name" "$prefix"
  done
}

# For replace custom prefix of public method. Private method name never changed.
import() {
  _lobash_imports "$@"
}
