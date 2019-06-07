# ---
# Category: String
# Since: 0.1.0
# Usage: printf '' | l.count_lines
# Description: The command and process substitution always trim blank line. So l.count_lines do not accept normal parameter passing.
# Description: Refer to https://stackoverflow.com/a/37706905
# ---

l.count_lines() {
  local count=0
  if [[ $# == 0 ]]; then
    # It is piping
    while read -r -d $'\n' _; do
      ((count+=1))
    done
    printf '%s\n' "$count"
  else
    echo "Please use pipe to pass parameter." >&2
    return 3
  fi
}
