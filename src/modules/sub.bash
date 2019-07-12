# ---
# Category: Arithmetic
# Since: 0.1.0
# Usage: l.sub <var_name> [<subtrahend>=1]
# Description: Subtract number with subtrahend.
# ---

l.sub() {
  local var_name=$1
  eval "((${var_name}-=${2:-1})) || true"
}
