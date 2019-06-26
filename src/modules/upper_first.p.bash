# ---
# Category: String
# Since: 0.1.0
# Usage: echo <string> | l.upper_first.p
# Description: The pipeline version of l.upper_first
# Dependent: upper_first
# ---

l.upper_first.p() {
  local str
  IFS='' read -r str
  l.upper_first "$str"
}
