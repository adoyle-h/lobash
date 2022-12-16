# ---
# Category: Array
# Since: 0.6.0
# Usage: l.head <count> < "file"
# Description: Display first lines from pipe
# ---

l.head() {
  local lines
  mapfile -tn "$1" lines
  printf '%s\n' "${lines[@]}"
}
