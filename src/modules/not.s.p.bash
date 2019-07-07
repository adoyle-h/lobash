# ---
# Category: Condition
# Since: 0.1.0
# Usage: echo <condition> | l.not.s.p
# Description: The pipeline version of l.not
# Dependent: not.s
# ---

l.not.s.p() {
  local condition
  read -r condition
  l.not.s "$condition"
}
