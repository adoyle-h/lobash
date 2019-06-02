# ---
# Category: File
# Since: 0.1.0
# Usage: l.count_file_lines <filepath>
# ---

l.count_file_lines() {
  wc -l "$1" | awk '{print $1}'
}
