# ---
# Category: Terminal
# Since: 0.1.0
# Usage: l.cursor_pos [<array_name>]
# Description: Get current cursor position.
# Description: If `<array_name>` passed, it will assign row to `${array_name[0]}`, and col to `${array_name[1]}`.
# Description: Otherwise, it prints `$row\n$column\n`.
# ---

# l.cursor_pos() {
#   stty size
# }

# Refer to https://github.com/dylanaraps/pure-bash-bible#get-the-current-cursor-position
# and https://unix.stackexchange.com/a/183121
l.cursor_pos() {
  local _ROW_ _COL_
  IFS='[;' read -p $'\e[6n' -d R -rs _ _ROW_ _COL_ _;

  if (( $# > 0 )); then
    IFS=' ' read -ra "$1" <<<"$_ROW_ $_COL_"
  else
    printf '%s\n' "$_ROW_" "$_COL_"
  fi
}
