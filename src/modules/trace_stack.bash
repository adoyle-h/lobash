# ---
# Category: Debug
# Since: 0.1.0
# Usage: l.trace_stack [label]
# Description: Print current function stack for debug.
# ---

l.trace_stack() {
  printf 'Trace Function Stack:%s\n  # Function (File:Line)\n' "${1:+ $1}"
  # Start from 2 Because upper function is an alias after build
  for i in $(seq 2 $(( ${#BASH_SOURCE[@]} -1 ))); do
    printf -- '  - %s (%s:%s)\n' "${FUNCNAME[$i]}" "${BASH_SOURCE[$i]}" "${BASH_LINENO[$i]}"
  done
}
