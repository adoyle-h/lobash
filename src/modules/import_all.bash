# ---
# Category: Core
# Since: 0.1.0
# Dependent: import
# ---

_lobash_import_all() {
  local prefix=${1:-}

  if [[ -n $prefix ]] && ! (_lobash_is_valid_lobash_prefix "$prefix"); then
    _lobash_in_warn "Module name prefix must ends with '.' or '-' or '_'."
    return 2
  fi

  local src_dir
  src_dir="$(dirname "${BASH_SOURCE[0]}")"

  declare -a modules
  modules=( $(ls "$src_dir") )

  _lobash_in_debug modules.size="${#modules[*]}" modules="${modules[*]}"

  declare -a module_names

  local module
  for module in "${modules[@]}"; do
    local name=${module%.bash}
    [[ ${_LOBASH_IMPORT_ENTRIES[*]} =~ ${name} ]] && continue
    module_names+=("$name")
  done

  _lobash_in_debug module_names.size="${#module_names[*]}" module_names="${module_names[*]}"

  if [[ -z "$prefix" ]]; then
    _lobash_imports "${module_names[@]}"
  else
    _lobash_imports "${module_names[@]}" "$prefix"
  fi
}

# For replace custom prefix of public method. Private method name never changed.
import_all() {
  _lobash_import_all "$@"
}
