# ---
# Category: String
# Since: 0.5.0
# Usage: l.str_replace_last <string> <pattern> <replace>
# Description: The first longest match of `<pattern>` is replaced with `<replace>`. But it matches from the end of string to the head.
# ---

l.str_replace_last() {
  echo "${1/%${2:-}/${3:-}}"
}
