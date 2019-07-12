# ---
# Category: Arithmetic
# Since: 0.1.0
# Usage: l.inc <var_name> [<addend>=1]
# Description: Increase number with addend.
# ---

l.inc() {
  local var_name=$1
  eval "((${var_name}+=${2:-1})) || true"
}
