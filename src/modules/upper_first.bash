# ---
# Category: String
# Since: 0.1.0
# Usage: l.upper_first <string>
# ---

# CAVEAT: Requires bash 4+
l.upper_first() {
  printf '%s\n' "${1^}"
}
