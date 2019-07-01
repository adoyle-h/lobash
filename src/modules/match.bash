# ---
# Category: String
# Since: 0.1.0
# Usage: l.match "string" "regex" [index=1]
# Description: Return matched part of string. Return empty string if no matched. Support capturing groups.
# ---

l.match() {
  [[ ${3:-} == 0 ]] && echo "index cannot be 0" >&2 && return 3

  if [[ $1 =~ $2 ]]; then
    if (( ${#BASH_REMATCH[@]} > 1 )); then
      printf '%s\n' "${BASH_REMATCH[${3:-1}]}"
    else
      echo ''
    fi
  else
    echo ''
  fi
}
