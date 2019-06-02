# ---
# Category: String
# Since: 0.1.0
# Usage: l.upper_case <string>
# ---

# CAVEAT: Requires bash 4+
l.upper_case() {
  printf '%s\n' "${1^^}"
}
