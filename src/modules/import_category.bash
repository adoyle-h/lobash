# ---
# Category: Core
# Since: 0.1.0
# Dependent: import
# ---

_lobash_import_categories() {
  local args=( "$@" )
  local args_len=${#args[@]}
  declare -a names
  local prefix

  if [[ $args_len -eq 0 ]]; then
    _lobash_in_error "Not found any parameters passed to import_category function."
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

  _lobash_in_debug category_names="${names[*]}" prefix="${prefix}"

  # @TODO get module_names by category_names

  _lobash_imports "${module_names[@]}" "$prefix"
}

import_category() {
  _lobash_import_categories "$@"
}
