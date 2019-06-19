# ---
# Category: Terminal
# Since: 0.1.0
# Usage: l.cursor_pos
# Usage: IFS=';' c_pos=( $(l.cursor_pos) )
# Description: get current cursor position. It will print "row;column" with default IFS.
# ---

# l.cursor_pos() {
#   stty size
# }

# Refer to https://unix.stackexchange.com/a/183121
l.cursor_pos() {
  local CURPOS
  read -rsdR -p $'\E[6n' CURPOS
  CURPOS=${CURPOS#*[} # Strip decoration characters <ESC>[
  echo "${CURPOS}"    # Return position in "row;col" format
}
