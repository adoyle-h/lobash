# ---
# Category: Terminal
# Since: 0.1.0
# Usage: l.cursor_pos [<array_name>]
# Usage: { IFS=';'; pos=( $(l.cursor_pos) ); }
# Description: Get current cursor position.
# Description: If `[<array_name>]` passed, it will assign row to `${array_name[0]}`, and col to `${array_name[1]}`.
# Description: If `[<array_name>]` not passed, it will print "row;column".
# ---

# l.cursor_pos() {
#   stty size
# }

# Refer to https://unix.stackexchange.com/a/183121
l.cursor_pos() {
  local CURPOS
  read -rsdR -p $'\E[6n' CURPOS
  CURPOS=${CURPOS#*[} # Strip decoration characters <ESC>[

  if (( $# > 0 )); then
    IFS=';' read -ra "$1" <<<"${CURPOS}"
  else
    echo "${CURPOS}"    # Return position in "row;col" format
  fi
}
