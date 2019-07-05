# ---
# Category: Debug
# Since: 0.1.0
# Usage: l.trace_stack [label]
# Description: Print current function stack for debug.
# ---

l.trace_stack() {
  printf '%s\n%s\n' \
    "Trace Function Stack:${1:+ $1}" \
    "  # Function (File:Line)"

  # _LOBASH_PUBLIC_DEPTH=2 in built lobash.bash, and _LOBASH_PUBLIC_DEPTH=1 in test or develop.
  for i in $(seq "$_LOBASH_PUBLIC_DEPTH" $(( ${#FUNCNAME[@]} -1 ))); do
    printf -- '  - %s (%s:%s)\n' "${FUNCNAME[$i]}" "${BASH_SOURCE[$i]:-(shell)}" "${BASH_LINENO[$i]}"
  done
}
