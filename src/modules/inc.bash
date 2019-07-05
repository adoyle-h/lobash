# ---
# Category: Arithmetic
# Since: 0.1.0
# Usage: l.inc <var_name> [<addend>=1]
# Description: Increase number with addend.
# Bash: 4.3
# ---

l.inc() {
  local -n l_inc_arg1=$1
  ((l_inc_arg1+=${2:-1})) || true
}
