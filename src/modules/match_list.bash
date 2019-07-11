# ---
# Category: String
# Since: 0.1.0
# Usage: l.match_list <string> <regex> <output_array_name>
# Description: Match multi strings with Regex Capturing Groups. The matched parts will be put in `<output_array_name>`.
# Bash: 4.3
# ---

l.match_list() {
  (( $# != 3 )) && echo "wrong parameters" >&2 && return 3

  local -n match_list_arg3=$3

  if [[ $1 =~ $2 ]]; then
    local len=${#BASH_REMATCH[@]}
    local i
    if (( len > 1 )); then
      for (( i = 1; i < len; i++ )); do
        match_list_arg3+=( "${BASH_REMATCH[$i]}" )
      done
    fi
  fi
}
