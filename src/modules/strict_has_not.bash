# ---
# Category: Condition
# Since: 0.1.0
# Usage: strict_has_not <command>
# Dependent: strict_has, not
# ---

l.strict_has_not() {
  local r
  r=$(l.strict_has "$@")
  l.not "$r"
}
