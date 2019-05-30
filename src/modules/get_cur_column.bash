_l.get_cur_column_unsup() {
  echo "Your system doesn't support retrieving $1 with tput.  Giving up." >&2
}

l.get_cur_column() {
  COLUMNS=$(tput cols) || _l.get_cur_column_unsup cols
}
