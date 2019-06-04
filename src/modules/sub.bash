# ---
# Category: Arithmetic
# Since: 0.1.0
# Usage: l.sub <var_name> [addend=1]
# ---

l.sub() {
  declare -n var=$1
  ((var-=${2:-1})) || true
}
