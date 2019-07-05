# ---
# Category: String
# Since: 0.1.0
# Usage: echo <string> | l.trim_start.p [<chars>=[[:space:]]]
# Description: The pipeline version of l.trim_start
# Dependent: trim_start
# ---

l.trim_start.p() {
  local str
  IFS='' read -r str

  if (( $# == 0 )); then
    l.trim_start "$str"
  else
    l.trim_start "$str" "${@}"
  fi
}
