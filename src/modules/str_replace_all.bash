# ---
# Category: String
# Since: 0.5.0
# Usage: l.str_replace_all <string> <pattern> <replace>
# Description: All matches of `<pattern>` are replaced with `<replace>`.
# ---

l.str_replace_all() {
  echo "${1//${2:-}/${3:-}}"
}
