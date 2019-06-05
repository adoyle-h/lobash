# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.join <IFS> <arg>...
# ---

l.join() {
  local _IFS=${IFS:- }
  IFS=${1}
  shift
  printf '%s\n' "$*"
  IFS=$_IFS
}
