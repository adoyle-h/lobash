# ---
# Category: String
# Since: 0.1.0
# Dependent: trim_start, trim_end
# Usage: l.trim <string>
# ---

l.trim() {
  [[ $# -eq 0 ]] && return 2

  l.trim_end "$(l.trim_start "$1")"
}
