# ---
# Category: Debug
# Since: 0.1.0
# Usage: l.trace_stack [label]
# Description: Print current function stack for debug.
# ---

l.trace_stack() {
  printf 'Trace Function Stack:%s\n  # Function (File:Line)\n' "${1:+ $1}"
  # _LOBASH_PUBLIC_DEPTH=2 in built lobash.bash, and _LOBASH_PUBLIC_DEPTH=1 in test.
  for i in $(seq "$_LOBASH_PUBLIC_DEPTH" $(( ${#BASH_SOURCE[@]} -1 ))); do
    printf -- '  - %s (%s:%s)\n' "${FUNCNAME[$i]}" "${BASH_SOURCE[$i]}" "${BASH_LINENO[$i]}"
  done
}
