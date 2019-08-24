# ---
# Category: String
# Since: 0.4.0
# Usage: l.str_replace_all <string> <pattern> <replacement>
# Description: Replaces all matches for pattern in string with replacement.
# ---

l.str_replace_all() {
  echo "${1//$2/$3}"
}
