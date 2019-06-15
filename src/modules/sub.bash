# ---
# Category: Arithmetic
# Since: 0.1.0
# Usage: l.sub <var_name> [<subtrahend>=1]
# Description: Subtract number with subtrahend.
# ---

l.sub() {
  local -n l_sub_arg1=$1
  ((l_sub_arg1-=${2:-1})) || true
}
