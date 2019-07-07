# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.has_not.s <condition> <what>
# Dependent: has.s, not.s
# Description: Opposite to l.has.s
# ---

l.has_not.s() {
  local r
  r=$(l.has.s "$@")
  l.not.s "$r"
}
