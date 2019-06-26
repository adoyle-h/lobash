# ---
# Category: String
# Since: 0.1.0
# Usage: echo <string> | l.lower_first.p
# Description: The pipeline version of l.lower_first
# Dependent: lower_first
# ---

l.lower_first.p() {
  local str
  IFS='' read -r str
  l.lower_first "$str"
}
