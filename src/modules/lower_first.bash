# ---
# Category: String
# Since: 0.1.0
# Usage: l.lower_first <string>
# ---

# CAVEAT: Requires bash 4+
l.lower_first() {
  printf '%s\n' "${1,}"
}
