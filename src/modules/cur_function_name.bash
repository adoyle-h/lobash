# ---
# Category: Variable
# Since: 0.1.0
# Usage: l.cur_function_name
# Description: Return the name of current function where the l.cur_function_name called in.
# ---

l.cur_function_name() {
  # _LOBASH_PUBLIC_DEPTH=1 in built lobash.bash, and _LOBASH_PUBLIC_DEPTH=2 in test.
  printf '%s\n' "${FUNCNAME[$_LOBASH_PUBLIC_DEPTH]}"
}
