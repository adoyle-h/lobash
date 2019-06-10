# ---
# Category: String
# Since: 0.1.0
# Usage: l.str_size <string>
# Description: return the sum of letters.
# ---

l.str_size() {
  printf -- '%s\n' "${#1}"
}
