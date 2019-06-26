# ---
# Category: Condition
# Since: 0.1.0
# Usage: echo <condition> | l.not.p
# Description: The pipeline version of l.not
# Dependent: not
# ---

l.not.p() {
  local condition
  read -r condition
  l.not "$condition"
}
