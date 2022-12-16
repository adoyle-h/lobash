# ---
# Category: Array
# Since: 0.6.0
# Usage: l.seq <fn> <start> <end> [<step>=1]
# Description: Same to `for i in {<start>..<end>..<step>}; do <fn> "$i"; done`
# Description: `<step>` must be positive integer. And `<end>` can be less than `<start>`.
# Description: It can print zero-padded numbers. `l.seq <fn> 01 100`
# Notice: With Bash 4.0, do not use zero-padded numbers, bash has a bug.
# ---

l.seq() {
  local i
  for i in $(eval "echo {$2..$3..${4:-1}}"); do $1 "$i"; done
}
