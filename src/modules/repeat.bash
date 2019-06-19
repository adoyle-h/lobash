# ---
# Category: Util
# Since: 0.1.0
# Usage: l.repeat <N> <command_name> [<command_args>]...
# Description: Execute command in N times.
# ---

l.repeat() {
  local -i n=$1
  (( n == 0 )) && return
  (( n < 0 )) && return

  shift
  for n in $(seq "$n"); do
    "$@"
  done
}
