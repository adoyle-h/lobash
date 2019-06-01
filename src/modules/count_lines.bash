# ---
# Category: String
# Since: 0.1.0
# ---

l.count_lines() {
  local count
  count=$(wc -l <<< "$1")
  printf '%s\n' "${count// /}"
}
