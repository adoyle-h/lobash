# Usage: _get_module_path module_name
# function depth: 2
_get_module_path() {
  echo "$(dirname "${BASH_SOURCE[0]}")/modules/$1.bash"
}

_get_module_metadata_str() {
  local module_name=$1
  local module_path
  module_path=$(_get_module_path "$module_name")
  sed -n '/^# ---$/,/^# ---$/p' "$module_path" | sed '1d;$d;s/^# //'
}

alias module_meta=_get_module_metadata_str
