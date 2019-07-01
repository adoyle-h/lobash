# ---
# Category: String
# Since: 0.1.0
# Usage: echo <string> | l.trim_color.p
# Description: The pipeline version of l.trim_color
# Dependent: trim_color
# ---

l.trim_color.p() {
  local str
  read -r str
  l.trim_color "$str"
}
