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
  local module_path=$1
  head -n "$_LOBASH_METADATA_MAX_LINES" "$module_path" | sed -n '/^# ---$/,/^# ---$/p' | sed '1d;$d;s/^# //'
}

_get_module_metadata_str_by_name() {
  local module_name=$1
  local module_path
  module_path=$(_get_module_path "$module_name")
  _get_module_metadata_str "$module_path"
}
