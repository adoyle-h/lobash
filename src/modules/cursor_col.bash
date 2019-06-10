# ---
# Category: Terminal
# Since: 0.1.0
# Usage: l.cursor_col
# ---

# Refer to https://unix.stackexchange.com/a/183121
l.cursor_col() {
  local COL
  local ROW
  IFS=';' read -sdR -p $'\E[6n' ROW COL
  echo "${COL}"
}
