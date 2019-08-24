# ---
# Category: String
# Since: 0.4.0
# Usage: l.str_replace <string> <pattern> <replacement>
# Description: Replaces first match for pattern in string with replacement.
# ---

l.str_replace() {
  echo "${1/$2/$3}"
}
