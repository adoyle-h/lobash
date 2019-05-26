# ---
# Category: String
# Since: 0.1.0
# ---

count_lines() {
  local count
  count=$(wc -l <<< "$1")
  echo "${count// /}"
}
