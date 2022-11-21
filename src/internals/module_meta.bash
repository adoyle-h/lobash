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
  local IFS='.'
  info_a=( $1 )
  info_b=( $2 )

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
  local index=${3:-0}

  if [[ -z ${_LOBASH_MOD_META_CACHE[$module_name]:-} ]]; then
    echo "Not found module '$module_name' from cache." >&2
    return 3
  fi

  printf '%s\n' "${_LOBASH_MOD_META_CACHE[${module_name}_${type_name}_${index}]:-}"
}

_lobash.meta_set_default() {
  local key=$1
  if [[ -z ${metadatas[${key}_0]:-} ]]; then
    metadatas[${key}_0]=$2
    metadatas[${key}_count_0]=1
  fi
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
    [Module_0]=$module_name
    [Module_count_0]=1
  )

  local -A counts c
  while read -r line; do
    # Example: # Category: Arithmetic
    #           meta_type: meta_values
    meta_type=$(sed -E 's/^# ([-_a-zA-Z0-9]+):.+$/\1/' <<< "$line" || true)
    [[ -z $meta_type ]] && continue
    meta_values=$(sed -E 's/^# [-_a-zA-Z0-9]+: ?(.+)$/\1/' <<< "$line" || true)

    if [[ -z ${counts[$meta_type]:-} ]]; then
      counts[$meta_type]=1
    else
      counts[$meta_type]=$(( ${counts[$meta_type]} + 1 ))
    fi

    c=$(( counts["$meta_type"] - 1 ))
    metadatas[${meta_type}_${c}]="$meta_values"
  done < <(sed -n '/^# ---$/,/^# ---$/p' < "$module_path" | sed '1d;$d;' || true)

  for meta_type in "${_LOBASH_BASIC_META_TYPES[@]}"; do
    metadatas[${meta_type}_count_0]=${counts[$meta_type]:-0}
  done

  _lobash.meta_set_default Usage Unknown
  _lobash.meta_set_default Category Unknown
  _lobash.meta_set_default Deprecated false
  _lobash.meta_set_default Status tested
  _lobash.meta_set_default Bash 4.0

  if [[ -n ${metadatas[Dependent_0]:-} ]]; then
    _lobash.with_IFS ',' 'deps=( ${metadatas[Dependent_0]} )'

    local dep compare dep_bashver
    for dep in "${deps[@]}"; do
      dep=${dep// /}
      _lobash.scan_module_metadata "$dep"

      dep_bashver="$(_lobash.get_module_metadata "$dep" Bash)"
      compare=$(_lobash.semver_compare "$dep_bashver" "${metadatas[Bash_0]}")
      if (( compare > 0 )); then
        metadatas[Bash_0]=$dep_bashver
      fi
    done
  fi

  local key
  for key in "${!metadatas[@]}"; do
    _LOBASH_MOD_META_CACHE[${module_name}_$key]=${metadatas[$key]}
  done
  _LOBASH_MOD_META_CACHE[$module_name]=true
}
