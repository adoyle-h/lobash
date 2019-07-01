# ---
# Category: Condition
# Since: 0.1.0
# Usage: strict_has_not <condition> <what>
# Dependent: strict_has, not
# Description: Opposite to strict_has.
# ---

l.strict_has_not() {
  local r
  r=$(l.strict_has "$@")
  l.not "$r"
}
