# ---
# Category: Terminal
# Since: 0.1.0
# Usage: l.cursor_pos
# Usage: IFS=';' c_pos=( $(l.cursor_pos) )
# ---

# Refer to https://unix.stackexchange.com/a/183121
l.cursor_pos() {
  local CURPOS
  read -sdR -p $'\E[6n' CURPOS
  CURPOS=${CURPOS#*[} # Strip decoration characters <ESC>[
  echo "${CURPOS}"    # Return position in "row;col" format
}
