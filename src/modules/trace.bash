# ---
# Category: Console
# Since: 0.1.0
# ---

# Usage: l.trace [label]
l.trace() {
  printf 'Trace:%s\n  # Function (File:Line)\n' "${1:+ $1}"
  for i in $(seq 1 $(( ${#BASH_SOURCE[@]} -1 ))); do
    printf -- '  - %s (%s:%s)\n' "${FUNCNAME[$i]}" "${BASH_SOURCE[$i]}" "${BASH_LINENO[$i]}"
  done
}
