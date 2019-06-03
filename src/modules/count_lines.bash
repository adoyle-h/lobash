# ---
# Category: String
# Since: 0.1.0
# Usage: l.count_lines <var>
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
    while read -r; do
      count=$(( "$count" + 1 ))
    done

    printf '%s\n' "$count"
  else
    count=$(wc -l <<< "$1")
    printf '%s\n' "${count// /}"
  fi
}