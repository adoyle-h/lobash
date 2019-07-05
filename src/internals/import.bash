# ---
# Category: Lobash
# Since: 0.1.0
# Usage: import [-f|--force] <module_name>... [<prefix>=l.]
# Description: Import Lobash modules.
# Description: <prefix> must end with `.`, `-`, `_`
# Description: -f, --force  To force refresh module codes. Because imported modules will be cached by default.
# ---

## Usage: _lobash.get_module_path <module_name>
_lobash.get_module_path() {
  if [[ -z ${IS_LOBASH_TEST:-} ]]; then
    printf '%s\n' "$(_lobash.dirname "${BASH_SOURCE[0]}")/../modules/$1.bash"
  else
    printf '%s\n' "$LOBASH_ROOT_DIR/src/modules/$1.bash"
  fi
}

_lobash.import_deps() {
  local module_path=$1
  local deps

  # Get list of dependent modules names
  IFS=' ' read -ra deps <<< "$( sed -n '/^# ---$/,/^# ---$/p' < "$module_path" \
    | grep '^# Dependent:' \
    | sed -E 's/^# Dependent: ?(.*)/\1/;s/,/ /g' \
    || true )"

  _lobash.debug "To load deps modules. deps.size=${#deps[*]}"
  if [[ ${#deps[@]} -gt 0 ]]; then
    _lobash.imports "${deps[@]}"
  fi
}

_lobash.import() {
  local module_name=$1
  local is_force=${2:-false}

  _lobash.debug "S1. To load module. name=${module_name}"

  [[ -z $module_name ]] && _lobash.error "Module name cannot be empty string." && return 3

  # Associative array only allow [a-zA-Z0-9_] for key naming
  local import_key=_lobash_import_cache_${module_name//[^a-zA-Z0-9]/_}
  if [[ $is_force == false ]] && [[ "${!import_key:-}" == loaded ]]; then
    _lobash.debug "import_key=${import_key} is loaded. skip load"
    return;
  else
    # To load module source code
    local module_path
    module_path=$(_lobash.get_module_path "$module_name")
    _lobash.debug "S2. module_name=${module_name} module_path=${module_path}"
    [[ ! -f $module_path ]] && _lobash.error "Not found module '${module_name}'." && return 4

    _lobash.import_deps "$module_path"

    _lobash.debug "S5. To load the source code of main module. module_path=$module_path"
    source "$module_path"

    read -r "$import_key" <<< 'loaded'
  fi

  _lobash.debug "Loaded module. import_key=${import_key}"
}

_lobash.imports() {
  local is_force=false
  if [[ ${1:-} == '-f' ]] || [[ ${1:-} == '--force' ]]; then
    shift
    is_force=true
  fi

  local name
  for name in "$@"; do
    _lobash.import "$name" "$is_force"
  done
}
