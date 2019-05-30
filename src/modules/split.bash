# ---
# Category: String
# Since: 0.1.0
# ---

# Usage: split string delimiter
# l.split() {
#   local string=$1
#   local delimiter=${2:- }
#   [[ $# -gt 1 ]] && [[ -z $2 ]] && echo "$string" && return 0

#   local _IFS=${IFS:- }
#   declare -a words

#   IFS=$'\n' read -d "" -ra words <<< "${string//$delimiter/$'\n'}"

#   IFS=$_IFS

#   printf '%s\n' "${words[@]}"
# }

l.split() {
  local string=$1
  local delimiter="${2:- }"
  [[ $# -gt 1 ]] && [[ -z $2 ]] && echo "$string" && return 0

  words=()
  while read -rd "$delimiter" i; do
    words+=("$i")
  done < <(printf '%s%s' "$string" "$delimiter")

  printf '%s\n' "${words[@]}"
}
