# ---
# Category: String
# Since: 0.1.0
# ---

# CAVEAT: Requires bash 4+
l.lower_case() {
  printf '%s\n' "${1,,}"
}
