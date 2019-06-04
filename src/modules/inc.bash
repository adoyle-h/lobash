# ---
# Category: Arithmetic
# Since: 0.1.0
# Usage: l.inc <var_name> [addend=1]
# ---

l.inc() {
  declare -n var=$1
  ((var+=${2:-1})) || true
}
