# ---
# Category: Core
# Since: 0.1.0
# Dependent: import
# ---

import_all() {
  local prefix=${1:-}
  local src_dir
  src_dir="$(dirname "${BASH_SOURCE[0]}")"

  declare -a modules
  modules=( $(ls "$src_dir") )

  for module in "${modules[@]}"; do
    local name=${module%.bash}
    import "$name" "$prefix"
  done
}
