# ---
# Category: String
# Since: 0.1.0
# Usage: l.match "string" "regex" [index=1]
# Description: Return matched part of string. Return empty string if no matched. Support capturing groups.
# ---

l.match() {
  if [[ $1 =~ $2 ]]; then
    printf '%s\n' "${BASH_REMATCH[${3:-1}]}"
  else
    true
  fi
}
