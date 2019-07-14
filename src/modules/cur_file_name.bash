# ---
# Category: Variable
# Since: 0.1.0
# Usage: l.cur_file_name
# Description: Return the name of current file where the l.cur_file_name called in.
# ---

# Reference: https://stackoverflow.com/a/192337
l.cur_file_name() {
  basename "$(test -L "$0" && readlink "$0" || echo "$0")"
}
