# ---
# Category: String
# Since: 0.1.0
# Usage: echo <string> | l.count_lines.p
# Description: The pipeline version of l.count_lines
# ---

l.count_lines.p() {
  local count=0
  while read -r -d $'\n' _; do
    ((count+=1))
  done
  printf '%s\n' "$count"
}
