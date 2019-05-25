# ---
# Category: Core
# Since: 0.1.0
# Dependent: import
# ---

_lobash_import_all() {
  local prefix=${1:-}
  local src_dir
  src_dir="$(dirname "${BASH_SOURCE[0]}")"

  declare -a modules
  modules=( $(ls "$src_dir") )

  for module in "${modules[@]}"; do
    local name=${module%.bash}
    _lobash_import "$name" "$prefix"
  done
}

# For replace custom prefix of public method. Private method name never changed.
import_all() {
  _lobash_import_all "$@"
}
