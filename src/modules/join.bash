# ---
# Category: Condition
# Since: 0.1.0
# ---

# Usage: join IFS arg1 arg2 [...argN]
join() {
  local _IFS=${IFS:- }
  IFS=${1}
  shift
  echo "$*"
  IFS=$_IFS
}
