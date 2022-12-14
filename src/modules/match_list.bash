# ---
# Category: String
# Since: 0.4.0
# Usage: l.match_list <string> <regex> <output_array_name>
# Description: Match multi strings with Regex Capturing Groups. The matched parts will be put in `<output_array_name>`.
# ---

l.match_list() {
  (( $# != 3 )) && echo "wrong parameters" >&2 && return 3

  if [[ $1 =~ $2 ]]; then
    local _len_=${#BASH_REMATCH[@]}
    local _i_
    if (( _len_ > 1 )); then
      for (( _i_ = 1; _i_ < _len_; _i_++ )); do
        eval "${3}+=( \"\${BASH_REMATCH[$_i_]}\" )"
      done
    fi
  fi
}
