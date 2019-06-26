# ---
# Category: String
# Since: 0.1.0
# Usage: l.count_lines <string>
# Description: The command and process substitution always trim blank line. So l.count_lines do not accept normal parameter passing.
# Description: Refer to https://stackoverflow.com/a/37706905
# ---

l.count_lines() {
  printf '%b' "$1" | wc -l | tr -d ' '
}
