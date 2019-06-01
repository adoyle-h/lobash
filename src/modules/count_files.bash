# ---
# Category: File
# Since: 0.1.0
# ---

# Usage: count /path/to/dir/*
#        count /path/to/dir/*/
l.count_files() {
  printf '%s\n' "$#"
}
