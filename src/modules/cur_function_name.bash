# ---
# Category: Variable
# Since: 0.1.0
# Usage: l.cur_function_name
# ---

l.cur_function_name() {
  printf '%s\n' "${FUNCNAME[1]}"
}
