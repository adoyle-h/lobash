# ---
# Category: Terminal
# Since: 0.6.0
# Usage: l.term_size
# Description: Print the terminal size. Format: `$lines\n$columns\n`
# Description: You can use `l.read_array term < <(l.term_size)` to create an array.
# ---

# Refer to https://github.com/dylanaraps/pure-bash-bible#get-the-terminal-size-in-lines-and-columns-from-a-script
l.term_size() {
  local status
  status=$(shopt -p checkwinsize)
  # (:;:) is a micro sleep to ensure the variables are exported immediately.
  shopt -s checkwinsize; (:;:)
  printf '%s\n' "$LINES" "$COLUMNS"
  $status
}
