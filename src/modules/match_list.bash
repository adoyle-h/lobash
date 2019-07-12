# ---
# Category: String
# Since: 0.1.0
# Usage: l.match_list <string> <regex> <output_array_name>
# Description: Match multi strings with Regex Capturing Groups. The matched parts will be put in `<output_array_name>`.
# ---

l.match_list() {
  (( $# != 3 )) && echo "wrong parameters" >&2 && return 3

  local output_array_name=$3

  if [[ $1 =~ $2 ]]; then
    local len=${#BASH_REMATCH[@]}
    local i
    if (( len > 1 )); then
      for (( i = 1; i < len; i++ )); do
        eval "${output_array_name}+=( \"\${BASH_REMATCH[$i]}\" )"
      done
    fi
  fi
}
