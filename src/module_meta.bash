# ---
# Category: Core
# Since: 0.1.0
# ---

source "$(dirname "${BASH_SOURCE[0]}")"/internals/consts.bash

# Usage: _get_module_path module_name
# function depth: 2
_get_module_path() {
  echo "$(dirname "${BASH_SOURCE[0]}")/modules/$1.bash"
}

_get_module_metadata_str() {
  local module_name=$1
  local module_path
  local _LOBASH_METADATA_MAX_LINES=10
  module_path=$(_get_module_path "$module_name")
  head -n $_LOBASH_METADATA_MAX_LINES | sed -n '/^# ---$/,/^# ---$/p' "$module_path" | sed '1d;$d;s/^# //'
}
