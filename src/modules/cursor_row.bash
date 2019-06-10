# ---
# Category: Terminal
# Since: 0.1.0
# Usage: l.cursor_row
# ---

# Refer to https://unix.stackexchange.com/a/183121
l.cursor_row() {
  local COL
  local ROW
  IFS=';' read -sdR -p $'\E[6n' ROW COL
  # Strip decoration characters <ESC>[
  echo "${ROW#*[}"
}
