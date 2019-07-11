# ---
# Category: Util
# Since: 0.1.0
# Usage: l.parse_params <opts_name> <args_name> "$@"
# Usage: l.parse_params _ <args_name> "$@"
# Usage: l.parse_params <opts_name> _ "$@"
# Description: It parses all parameters "$@" and put arguments to `args_name` and
# Description: `opts_name` must be an associative array or "_". If "_", no options will be parsed.
# Description: `args_name` must be an array or "_". If "_", no arguments will be parsed.
# Description: See test cases for details.
# Dependent: start_with, match, match_list
# Bash: 4.3
# ---

_l.parse_single_hyphen_options() {
  local param=${1#-}

  # Possible Formats:
  # -a 3 or -abc 3
  # -a or -a3 or -abc3
  # -a=3 or -abc=3
  # -a= or -abc=

  local -a matches=()
  local k letters
  l.match_list "$param" '^(.+)=(.*)$' matches
  if (( ${#matches[@]} == 2 )); then
    # -a=3 or -abc=3
    # -a= or -abc=
    letters=${matches[0]}
    parse_params_opts[${letters: -1:1}]=${matches[1]}

    letters=${letters:0:-1}
    for (( k = 0; k < ${#letters} ; k++ )); do
      parse_params_opts[${letters:$k:1}]=true
    done
    return
  fi

  if (( $# == 2 )); then
    # -a 3 or -abc 3
    parse_params_opts[${param: -1:1}]=$2
    (( i+=1 ))

    letters=${param:0:-1}
    for (( k = 0; k < ${#letters}; k++ )); do
      parse_params_opts[${letters:$k:1}]=true
    done
    return
  else
    # -a or -a3 or -abc3
    for (( k = 0; k < ${#param}; k++ )); do
      parse_params_opts[${param:$k:1}]=true
    done
    return
  fi

  echo "Unknown option: -$param" >&2
  return 4
}

_l.parse_double_hyphen_options() {
  local param=${1#--}

  local -a matches=()
  l.match_list "$param" '^(.+)=(.*)' matches

  if (( ${#matches[@]} == 2 )); then
    parse_params_opts[${matches[0]}]=${matches[1]}
  else
    local key
    key=$(l.match "$param" '^no-(.+)')
    if [[ -n $key ]]; then
      parse_params_opts[$key]=false
    else
      key=$param
      if (( $# == 2 )); then
        parse_params_opts[$key]="$2"
      else
        parse_params_opts[$key]=true
      fi
    fi
  fi
}

l.parse_params() {
  if (( $# < 2 )); then
    echo "parse_params: programming error. Parameters cannot less than 2." >&2
    return 3
  fi

  if [[ $1 != _ ]]; then
    local -n parse_params_opts=$1
  else
    local -A parse_params_opts
  fi

  if [[ $2 != _ ]]; then
    local -n parse_params_args=$2
  else
    local -a parse_params_args
  fi

  local param_size=$#
  local param
  local rest_is_args=false
  for (( i = 3; i <= param_size; i++ )); do
    param=${!i}

    if l.start_with "$param" '-'; then
      local j=$(( i+1 ))
      local f

      if [[ $param == '--' ]]; then
        rest_is_args=true
        (( i+=1 ))
        break;
      fi

      if l.start_with "$param" '--'; then
        f=_l.parse_double_hyphen_options
      else
        f=_l.parse_single_hyphen_options
      fi

      if (( j > param_size )) ; then
        $f "$param"
      else
        local next=${!j}
        if l.start_with "$next" '-' ; then
          $f "$param"
        else
          $f "$param" "$next"
        fi
      fi
    else
      parse_params_args+=("$param")
    fi
  done

  if [[ $rest_is_args == true ]]; then
    for (( ; i <= param_size; i++ )); do
      param=${!i}
      parse_params_args+=("$param")
    done
  fi
}
