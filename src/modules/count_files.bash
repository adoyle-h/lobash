# ---
# Category: File
# Since: 0.1.0
# Dependent: count_lines
# ---

# Usage: l.count_files /path/to/dir/*
#        l.count_files /path/to/dir/*/
l.count_files() {
  find "$1" -type f | l.count_lines
}
