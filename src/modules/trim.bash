# ---
# Category: String
# Since: 0.1.0
# Dependent: trim_start, trim_end
# Usage: l.trim <string>
# ---

l.trim() {
  local r
  r=$(l.trim_start "$1")
  l.trim_end "$r"
}
