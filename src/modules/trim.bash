# ---
# Category: String
# Since: 0.1.0
# Usage: l.trim <string>
# Description: Remove leading and trailing whitespace from string.
# Dependent: trim_start, trim_end
# ---

l.trim() {
  local str=${1:-}
  str=$(l.trim_start "$str")
  l.trim_end "$str"
}
