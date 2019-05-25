import_all() {
  local prefix=${1:-l.}
  local src_dir
  src_dir="$(dirname "${BASH_SOURCE[0]}")"

  declare -a modules
  modules=( $(ls "$src_dir"/modules) )

  for module in "${modules[@]}"; do
    local name=${module%.bash}
    import "$name" "$prefix"
  done
}

import() {
  local module_name=$1
  local prefix=${2:-}
  local src_dir
  src_dir="$(dirname "${BASH_SOURCE[0]}")"

  [[ -n ${LOBASH_DEBUG:-} ]] && echo "[debug:lobash] To load module: $src_dir/modules/${module_name}.bash"
	source "$src_dir/modules/${module_name}.bash"
}
