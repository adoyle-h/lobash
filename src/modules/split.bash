# ---
# Category: String
# Since: 0.1.0
# Usage: l.split <string> [delimiter=' ']
# ---

l.split() {
  local string=$1
  local delimiter
  if [[ $# == 1 ]]; then
    delimiter=' '
  else
    delimiter="${2}"
  fi

  local i
  local -a words

  while read -rd "$delimiter" i; do
    words+=("$i")
  done < <(printf '%s%s' "$string" "$delimiter")


  printf '%s\n' "${words[@]}"
}
