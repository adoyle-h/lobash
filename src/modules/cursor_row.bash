# ---
# Category: Terminal
# Since: 0.1.0
# Usage: l.cursor_row
# Description: get row number of current cursor position
# ---

# Refer to https://unix.stackexchange.com/a/183121
l.cursor_row() {
  local ROW
  IFS=';' read -rsdR -p $'\E[6n' ROW _
  # Strip decoration characters <ESC>[
  echo "${ROW#*[}"
}
