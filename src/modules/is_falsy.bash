# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_falsy <var>
# Description: nonzero number and string "false" should be falsy.
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# Dependent: is_integer
# ---

l.is_falsy() {
  [[ -z ${1:-} ]] && return 1

  if l.is_integer "$1"; then
    [[ $1 != 0 ]]
  else
    [[ $1 == false ]]
  fi
}
