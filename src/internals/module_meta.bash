# _lobash.get_module_metadata_str <module_path>
_lobash.get_module_metadata_str() {
  sed -n '/^# ---$/,/^# ---$/p' < "$1" | sed '1d;$d;s/^# //'
}

# _lobash.get_module_path <module_name>
_lobash.get_module_path() {
  printf '%s\n' "$(dirname "${BASH_SOURCE[0]}")/../modules/$1.bash"
}

# _lobash.get_module_metadata <module_name>
_lobash.get_module_metadata() {
  local module_path=$1

  if [[ ! -f $module_path ]]; then
    echo "Not found module '$module_name'." >&2
    return 3
  fi

  local -n get_module_metadata_arg2=$2
  local line meta_type meta_values

  while read -r line; do
    meta_type=$(<<< "$line" sed -E "s/^# ([-_a-zA-Z0-9]+): ?(.+)$/\\1/" || true)
    [[ -z $meta_type ]] && continue
    meta_values=$(<<< "$line" sed -E "s/^# ([-_a-zA-Z0-9]+): ?(.+)$/\\2/" || true)
    get_module_metadata_arg2[$meta_type]="$meta_values"
  done < <(< "$module_path" sed -n '/^# ---$/,/^# ---$/p' | sed '1d;$d;')

  if [[ -z ${get_module_metadata_arg2[Bash]:-} ]]; then
    get_module_metadata_arg2[Bash]=4.0
  fi
}

_lobash.get_module_metadata_by_name() {
  local module_name=$1
  local -n get_module_metadata_by_name_arg2=$2
  local module_path
  module_path=$(_lobash.get_module_path "$module_name")
  _lobash.get_module_metadata "$module_path" get_module_metadata_by_name_arg2
}

_lobash.get_module_metadata_str_by_name() {
  local module_name=$1
  local module_path
  module_path=$(_lobash.get_module_path "$module_name")

  if [[ ! -f $module_path ]]; then
    echo "Not found module '$module_name'." >&2
    return 3
  fi

  _lobash.get_module_metadata_str "$module_path"
}
