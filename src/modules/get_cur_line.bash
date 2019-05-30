_l.get_cur_line_unsup() {
  echo "Your system doesn't support retrieving $1 with tput.  Giving up." >&2
}

l.get_cur_line() {
  LINES=$(tput lines) || _l.get_cur_line_unsup lines
}
