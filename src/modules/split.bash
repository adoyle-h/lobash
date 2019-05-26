# ---
# Category: String
# Since: 0.1.0
# ---

# Usage: split string delimiter
split() {
  local delimiter=$2
  local _IFS=${IFS:- }
  declare -a words

  IFS=$'\n' read -d "" -ra words <<< "${1//$delimiter/$'\n'}"

  IFS=$_IFS

  printf '%s\n' "${words[@]}"
}
