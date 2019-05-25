# ---
# Category: Core
# Since: 0.1.0
# ---

_debug() {
  if [[ -z ${LOBASH_DEBUG:-} ]]; then return; fi

  if [[ -z $LOBASH_DEBUG_OUTPUT ]]; then
    echo "[debug:lobash] $*"
  else
    echo "[debug:lobash] $*" >> "$LOBASH_DEBUG_OUTPUT"
  fi
}

# Usage: _get_module_path module_name
# function depth: 2
_get_module_path() {
  echo "$(dirname "${BASH_SOURCE[0]}")/$1.bash"
}

_get_module_meta_str() {
  local module_name=$1
  local module_path
  module_path=$(_get_module_path "$module_name")
  _debug "module_name=${module_name} module_path=${module_path}"
  sed -n '/^# ---$/,/^# ---$/p' "$module_path" | sed '1d;$d;s/^# //'
}

# @TODO cache each import by import_key
# if [[ ! -v __lobash_imports ]]; then
#   declare -A __lobash_imports
#   _debug "new __lobash_imports=${!__lobash_imports[*]}"
# else
#   _debug "use old __lobash_imports=${!__lobash_imports[*]}"
# fi

_lobash_import() {
  local module_name=$1
  local prefix=${2:-}

  # # Associative array only allow [a-zA-Z0-9_] for key naming
  # local import_key="${prefix//[^a-zA-Z0-9]/_}_${module_name}"
  # _debug "To load import_key=${import_key}, __lobash_imports=${!__lobash_imports[*]}"
  # if [[ "${__lobash_imports[$import_key]:-}" == loaded ]] ; then
  #   _debug "import_key=${import_key} is loaded. skip load"
  #   return;
  # fi

  local module_path
  module_path=$(_get_module_path "$module_name")

  local meta_str
  declare -a meta_deps
  meta_str="$(_get_module_meta_str "$module_name")"
  _debug "meta_str=${meta_str}"

  meta_deps=( $( echo "$meta_str" | grep '^Dependent:' | sed -E 's/^Dependent: ?(.*)/\1/;s/,/ /g' || [[ $? != 0 ]] ) )

  # _debug "import_key=${import_key}. To load module_path=${module_path} meta_deps=${meta_deps[*]} len=${#meta_deps[*]}"

  if [[ ${#meta_deps[@]} -gt 0 ]]; then
    for dep in "${meta_deps[@]}"; do
      _lobash_import "$dep" "$prefix"
    done
  fi

  if [[ -z $prefix ]]; then
    source "$module_path"
  else
    source <( cat "$module_path" | sed -E "s/^([A-Za-z0-9]\\w*)\\(\\) ?\\{/${prefix}\\1\\(\\) \\{/g" )
  fi

  # __lobash_imports[${import_key}]=loaded
  # _debug "Loaded import_key=${import_key}"
}

# For replace custom prefix of public method. Private method name never changed.
import() {
  _lobash_import "$@"
}
