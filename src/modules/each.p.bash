# ---
# Category: Array
# Since: next
# Usage: printf '1\n2\n' | l.each.p <fn>
# Description: Iterates over elements from pipe and invokes function with each element.
# Description: The function is invoked with two arguments: (value, index).
# Description: `<fn>` must be the function name.
# ---

l.each.p() {
  local _i_=0 _l_
  local IFS=$'\n'

  while read -r _l_; do
    $1 "$_l_" "$_i_"
    (( ++_i_ ))
  done
}
