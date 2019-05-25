# ---
# Category: Core
# Since: 0.1.0
# ---

# Usage: _get_module_path module_name
# function depth: 2
_get_module_path() {
  echo "$(dirname "${BASH_SOURCE[1]}")/$1.bash"
}

_get_module_meta_str() {
  local module_name=$1
  local module_path
  module_path=$(_get_module_path "$module_name")
  sed -n '/^# ---$/,/^# ---$/p' "$module_path" | sed '1d;$d;s/^# //'
}

_debug() {
  if [[ -z ${LOBASH_DEBUG:-} ]]; then return; fi
  echo "[debug:lobash] $*"
}

import() {
  local module_name=$1
  local prefix=${2:-}
  local module_path
  module_path=$(_get_module_path "$module_name")

  _debug "To load module: $module_path"

  local meta_str
  declare -a meta_deps
  meta_str=$(_get_module_meta_str "$module_name")
  meta_deps=( $(echo "$meta_str" | grep '^Dependent:' | sed -E 's/^Dependent: ?(.*)/\1/;s/,//g') )

  if [[ ${#meta_deps[@]} -gt 0 ]]; then
    for dep in "${meta_deps[@]}"; do
      import "$dep"
    done
  fi

  if [[ -z $prefix ]]; then
    source "$module_path"
  else
    source <( cat "$module_path" | sed -E "s/^([A-Za-z0-9]\\w*)\\(\\) ?\\{/${prefix}\\1\\(\\) \\{/g" )
  fi
}
