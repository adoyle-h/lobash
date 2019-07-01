# ---
# Category: String
# Since: 0.1.0
# Usage: echo <string> | l.upper_case.p
# Description: The pipeline version of l.upper_case
# Dependent: upper_case
# ---

l.upper_case.p() {
  local str
  IFS='' read -r str
  l.upper_case "$str"
}
