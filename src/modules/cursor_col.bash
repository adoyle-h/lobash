# ---
# Category: Terminal
# Since: 0.1.0
# Usage: l.cursor_col
# Description: Get column number of current cursor position.
# ---

# Refer to https://unix.stackexchange.com/a/183121
l.cursor_col() {
  local COL
  IFS=';' read -rsdR -p $'\E[6n' _ COL
  echo "${COL}"
}
