# ---
# Category: String
# Since: 0.1.0
# Usage: echo <string> | l.count_lines.p
# Description: Count lints of string like `wc -l`.
# Description: The Bash command substitution always trim blank line. So pass argument in pipeline.
# Description: Refer to https://stackoverflow.com/a/37706905
# ---

l.count_lines.p() {
  local count=0
  while read -r -d $'\n' _; do
    ((count+=1))
  done
  printf '%s\n' "$count"
}
