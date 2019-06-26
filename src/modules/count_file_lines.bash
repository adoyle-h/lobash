# ---
# Category: File
# Since: 0.1.0
# Usage: l.count_file_lines <filepath>
# Description: Count lines of file. Similar to `wc -l`.
# ---

# readarray slow than wc
# l.count_file_lines() {
#   # readarray supported since bash 4.0
#   readarray -tn 0 lines < "$1"
#   printf '%s\n' "${#lines[@]}"
# }

l.count_file_lines() {
  wc -l < "$1" | tr -d ' '
}
