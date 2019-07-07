# ---
# Category: File
# Since: 0.1.0
# Usage: l.count_files <directory_path>
# Description: Count the sum of files under `<directory_path>`.
# ---

l.count_files() {
  local files
  # compgen will return 1 when no matched files
  readarray -t files < <(compgen -f "$1"/ || [[ $? == 1 ]])

  printf '%s\n' "${#files[@]}"
}
