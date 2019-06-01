# ---
# Category: Condition
# Since: 0.1.0
# ---

# Usage: join IFS arg1 arg2 [...argN]
l.join() {
  local _IFS=${IFS:- }
  IFS=${1}
  shift
  printf '%s\n' "$*"
  IFS=$_IFS
}
