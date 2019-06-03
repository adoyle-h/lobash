# ---
# Category: Core
# Since: 0.1.0
# Dependent: import
# Usage: l.import_category <category_name1> <category_nameN> [prefix=l.]
# ---

_l.import_category() {
  local category=$1
  local prefix=$2
  local module_names
  while read -r module_names; do
    _l.imports "${module_names[@]}" "$prefix"
  done < "$(dirname "${BASH_SOURCE[0]}")"/../internals/categories/"$category"
}

_l.import_categories() {
  local args=( "$@" )
  local args_len=${#args[@]}
  declare -a categories
  local prefix

  if [[ $args_len -eq 0 ]]; then
    _lobash_error "Not found any parameters passed to import_category function."
    return 2
  elif [[ $args_len -eq 1 ]]; then
    categories=( "${args[@]}" )
    prefix=$_LOBASH_DEFAULT_PREFIX
  else
    prefix="${args[*]: -1:1}"

    if _lobash_is_valid_lobash_prefix "$prefix"; then
      categories=( "${args[@]:0:$args_len-1}" )
    else
      categories=( "${args[@]}" )
      prefix=$_LOBASH_DEFAULT_PREFIX
    fi
  fi

  _lobash_debug category_names="${categories[*]}" prefix="${prefix}"

  for c in "${categories[@]}"; do
    _l.import_category "$c" "$prefix"
  done
}

import_category() {
  _l.import_categories "$@"
}
