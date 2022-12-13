# ---
# Category: String
# Since: 0.1.0
# Usage: l.split <string> <output_array_name> [<delimiter>=' ']
# Usage: l.read_array <output_array_name> < <(l.split <string> - [<delimiter>=' '])
# Description: Splits string by delimiter. The delimiter defaults to ` `.
# Description: If `<output_array_name>` equals `-`, the result will be printed to stdout.
# Description: Otherwise, the result will be assigned to `<output_array_name>`.
# Notice: When in subshell, you must call `l.split <string> - [<delimiter>=' ']`.
# Notice: The `l.split <string> <output_array_name>` not works in subshell.
# ---

_l.split() {
  local -i i

  local dLen=${#delimiter}
  local sLen=${#string}

  if [[ $delimiter == '' ]]; then
    for (( i=0; i < sLen; i++ )); do
      printf '%s\n' "${string:$i:1}"
    done
    return 0
  fi

  local -a indexes=()
  local -i a=0 b=0 d

  while (( a < "$sLen" )); do
    for (( b=a+1; b <= sLen; b++ )); do
      d=$(( b - a )) || true
      if (( d > dLen )); then
        break;
      fi

      if [[ "${string:$a:$d}" == "$delimiter" ]]; then
        indexes+=("$a")
      fi
    done
    (( a++ )) || true
  done

  a=0
  if (( ${#indexes[@]} > 0 )); then
    for i in "${indexes[@]}"; do
      printf '%s\n' "${string:$a:$(( i - a ))}"
      a=$((i + dLen));
    done
  fi

  if (( a < sLen )); then
    printf '%s\n' "${string:$a}"
  elif (( a == sLen )); then
    printf '\n'
  fi
}

l.split() {
  local string=$1
  local output=$2
  local delimiter

  if [[ $# == 2 ]]; then
    delimiter=' '
  else
    delimiter="${3}"
  fi

  if [[ $2 == '-' ]]; then
    _l.split
  else
    IFS=$'\n' readarray -t "$output" < <(_l.split)
  fi
}
