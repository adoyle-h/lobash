_lobash.get_module_metadata_str() {
  local module_path=$1
  sed -n '/^# ---$/,/^# ---$/p' < "$module_path" | sed '1d;$d;s/^# //'
}

_lobash.get_module_metadata_str_by_name() {
  local module_name=$1
  local module_path
  module_path=$("$(dirname "${BASH_SOURCE[0]}")/../modules/$module_name.bash")
  _lobash.get_module_metadata_str "$module_path"
}
