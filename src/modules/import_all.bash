# ---
# Category: Lobash
# Since: 0.1.0
# Dependent: import
# Usage: import_all [prefix=l.]
# Description: Import all Lobash modules.
# Description: <prefix> must end with `.`, `-`, `_`
# ---

_l.import_all() {
  local prefix=${1:-$_LOBASH_DEFAULT_PREFIX}

  local src_dir shell_type
  src_dir="$(_lobash_dirname "${BASH_SOURCE[0]}")"
  shell_type=$(_lobash_get_shell_type)

  local -a categories=( $(find "$src_dir/../internals/categories/${shell_type}" -type f -exec basename {} \; ) )

  _lobash_debug "_l.import_categories ${categories[*]} $prefix"

  _l.import_categories "${categories[@]}" "$prefix"
}

# For replace custom prefix of public method. Private method name never changed.
import_all() {
  _l.import_all "$@"
}
