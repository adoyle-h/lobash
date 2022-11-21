# shellcheck disable=2016

print_meta_type() {
  printf -- '- %s:' "$meta_key" >> "$TARGET"
}

print_meta_value() {
  printf -- ' %s\n' "${1}" >> "$TARGET"
}

print_plural_meta_value() {
  printf -- '  - %s\n'  "${1}" >> "$TARGET"
}

print_meta_Usage() {
  printf -- ' `%s`\n' "${1}" >> "$TARGET"
}

print_plural_meta_Usage() {
  printf -- '  - `%s`\n' "${1}" >> "$TARGET"
}

print_meta_Dependent() {
  # local deps=( ${1//,/ } )
  IFS=' ' read -r -a deps <<<"${1//,/ }"

  local dep_cate dep_path
  for dep in "${deps[@]}"; do
    dep_cate=$(_lobash.get_module_metadata "$dep" Category)
    dep_path="./${dep_cate,,}.md#$dep"
    printf ' [`%s`](%s)' "${dep}" "${dep_path}" >> "$TARGET"
  done
  printf '\n' >> "$TARGET"
}

print_meta_skip_Deprecated() {
  [[ $1 != true ]]
}

print_meta_Deprecated() {
  if [[ -n ${1:-} ]]; then
    printf -- ' true\n' >> "$TARGET"
  fi
}

print_meta_Bash() {
  printf -- ' %s+\n' "$1" >> "$TARGET"
}

print_module_metas() {
  local module_name=$1
  local meta_val meta_key count i

  for meta_key in "${_LOBASH_BASIC_META_TYPES[@]}"; do
    count=$(_lobash.get_module_metadata "$module_name" "${meta_key}_count")

    if [[ -z ${count:-} ]] || (( count == 0 )) ; then continue; fi

    meta_val=$(_lobash.get_module_metadata "$module_name" "${meta_key}")

    if l.has function "print_meta_skip_${meta_key}" && \
      "print_meta_skip_${meta_key}" "${meta_val}"
    then
      continue
    fi

    print_meta_type "$meta_val"

    if (( count == 1 )); then
      if l.has function "print_meta_${meta_key}"; then
        "print_meta_${meta_key}" "${meta_val}" "${meta_key}"
      else
        print_meta_value "${meta_val}" "${meta_key}"
      fi
    else
      printf -- '\n' >> "$TARGET"

      for (( i = 0; i < count; i++ )); do
        meta_val=$(_lobash.get_module_metadata "$module_name" "${meta_key}" "$i")

        if l.has function "print_plural_meta_${meta_key}"; then
          "print_plural_meta_${meta_key}" "${meta_val}" "$i" "${meta_key}"
        else
          print_plural_meta_value "${meta_val}" "$i" "${meta_key}"
        fi
      done
    fi
  done
}
