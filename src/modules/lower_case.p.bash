# ---
# Category: String
# Since: 0.1.0
# Usage: echo <string> | l.lower_case.p
# Description: The pipeline version of l.lower_case
# Dependent: lower_case
# ---

l.lower_case.p() {
  local str
  IFS='' read -r str
  l.lower_case "$str"
}
