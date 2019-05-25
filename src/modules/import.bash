import() {
  local module_name=$1
  local prefix=${2:-}
  local src_dir
  src_dir="$(dirname "${BASH_SOURCE[0]}")"
  local filename="$src_dir/${module_name}.bash"

  [[ -n ${LOBASH_DEBUG:-} ]] && echo "[debug:lobash] To load module: $filename"

  if [[ -z $prefix ]]; then
    source "$filename"
  else
    source <( cat "$filename" | sed -E "s/^([A-Za-z0-9]\\w*)\\(\\) ?\\{/${prefix}\\1\\(\\) \\{/g" )
  fi
}

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
