# _lobash.get_module_metadata_str <module_path>
_lobash.get_module_metadata_str() {
  sed -n '/^# ---$/,/^# ---$/p' < "$1" | sed '1d;$d;s/^# //'
}

# _lobash.get_module_path <module_name>
_lobash.get_module_path() {
  printf '%s\n' "$(dirname "${BASH_SOURCE[0]}")/../modules/$1.bash"
}

# _lobash.semver_compare <ver_a> <ver_b>
# <ver_a> < <ver_b> => -1
# <ver_a> = <ver_b> => 0
# <ver_a> > <ver_b> => 1
_lobash.semver_compare() {
  local info_a info_b
  IFS='.' info_a=( $1 )
  IFS='.' info_b=( $2 )

  # result=$(( info_a[0] - info_b[0] ))
  if (( info_a[0] < info_b[0] )); then
    echo -1
  elif (( info_a[0] > info_b[0] )); then
    echo 1
  else
    if (( info_a[1] < info_b[1] )); then
      echo -1
    elif (( info_a[1] > info_b[1] )); then
      echo 1
    else
      echo 0
    fi
  fi
}

# _lobash.get_module_metadata <module_name> <type_name>
_lobash.get_module_metadata() {
  local module_name=$1
  local type_name=$2

  if [[ -z ${_LOBASH_MOD_META_CACHE[$module_name]:-} ]]; then
    echo "Not found module '$module_name' from cache." >&2
    return 3
  fi

  printf '%s\n' "${_LOBASH_MOD_META_CACHE[${module_name}_${type_name}]:-}"
}

# _lobash.scan_module_metadata <module_name>
# Get metadatas results from _LOBASH_MOD_META_CACHE[<module_name>_<type>]
_lobash.scan_module_metadata() {
  local module_name=$1
  module_path=$(_lobash.get_module_path "$module_name")

  if [[ ! -f $module_path ]]; then
    echo "Not found module '$module_name'." >&2
    return 3
  fi

  [[ -n ${_LOBASH_MOD_META_CACHE[$module_name]:-} ]] && return

  local line meta_type meta_values

  local -A metadatas=(
    [Module]=$module_name
  )

  while read -r line; do
    meta_type=$(<<< "$line" sed -E "s/^# ([-_a-zA-Z0-9]+): ?(.+)$/\\1/" || true)
    [[ -z $meta_type ]] && continue
    meta_values=$(<<< "$line" sed -E "s/^# ([-_a-zA-Z0-9]+): ?(.+)$/\\2/" || true)
    metadatas[$meta_type]="$meta_values"
  done < <(< "$module_path" sed -n '/^# ---$/,/^# ---$/p' | sed '1d;$d;' || true)

  if [[ -z ${metadatas[Deprecated]:-} ]]; then
    metadatas[Deprecated]=false
  fi

  if [[ -z ${metadatas[Status]:-} ]]; then
    metadatas[Status]=tested
  fi

  if [[ -z ${metadatas[Bash]:-} ]]; then
    metadatas[Bash]=4.0
  fi

  if [[ -n ${metadatas[Dependent]:-} ]]; then
    IFS=',' deps=( ${metadatas[Dependent]} )

    local dep compare
    for dep in "${deps[@]}"; do
      dep=${dep// /}
      _lobash.scan_module_metadata "$dep"

      local dep_bashver="${_LOBASH_MOD_META_CACHE[${dep}_Bash]}"
      compare=$(_lobash.semver_compare "$dep_bashver" "${metadatas[Bash]}")
      if (( compare > 0 )); then
        metadatas[Bash]=$dep_bashver
      fi
    done
  fi

  local key
  for key in "${!metadatas[@]}"; do
    _LOBASH_MOD_META_CACHE[${module_name}_$key]=${metadatas[$key]}
  done
  _LOBASH_MOD_META_CACHE[$module_name]=true
}
