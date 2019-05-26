# ---
# Category: Condition
# Since: 0.1.0
# ---

join() {
  local _IFS=${IFS:-}
  IFS=${1}
  shift
  echo "$*"
  IFS=$_IFS
}
