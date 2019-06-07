# ---
# Category: String
# Since: 0.1.0
# Usage: l.count_lines <var>
# Description: The command and process substitution always trim blank line. So l.count_lines do not accept normal parameter passing.
# Description: Refer to https://stackoverflow.com/a/37706905
# ---

# _l.count_lines.streamable() {
#   # local prev=$1
#   # local line=$2
#   local index=$3

#   printf '%s\n' $(( "$index" + 1 ))
# }

# _l.count_lines.unstreamable() {
#   local count
#   count=$(wc -l <<< "$1")
#   printf '%s\n' "${count// /}"
# }

# l.count_lines() {
#   l.streamable l.count_lines 1 "$@"
# }

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
