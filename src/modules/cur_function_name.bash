# ---
# Category: Variable
# Since: 0.1.0
# Usage: l.cur_function_name
# Description: Return the name of current function where the l.cur_function_name called in.
# ---

l.cur_function_name() {
  printf '%s\n' "${FUNCNAME[1]}"
}
