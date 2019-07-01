# ---
# Category: String
# Since: 0.1.0
# Usage: echo <string> | l.trim.p
# Description: The pipeline version of l.trim
# Dependent: trim
# ---

l.trim.p() {
  local str
  read -r str
  l.trim "$str"
}
