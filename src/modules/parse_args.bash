# ---
# Category: Util
# Since: 0.7.0
# Usage: l.parse_args <definition> "$@"
# Description: This function provides a simple way to parse options and arguments.
# Description: The `<definition>` is an associative array, which likes `{[opts]=opts_name [args]=args_name ['-f --flag']='bool'}`.
# Description: The `[opts]` and `[args]` are required for `<definition>`.
# Description: It parses all parameters "$@". Put arguments to the `args_name` and options to `opts_name`.
# Description: The `opts_name` must be an associative array or `_`. If set `_`, the options will be ignored.
# Description: The `args_name` must be an array or `_`. If set `_`, the arguments will be ignored.
# Description: The option has tree types:
# Description:   - "bool": For example, `-f`, `--flag` means `${f}` and `${flag}` equal to `"true"` and `--no-f` and `--no-flag` equal to `"false"`.
# Description:   - "count": the value of option defaults to 0. And increasing count by times. For example: `-v` `-vv` `-vvv`.
# Description:   - "kv": key/value. It means the option must has an argument. If user not pass argument to "kv" option. It will print error and stop.
# Description: All options are default to "kv". So only the bool and count options should defined in `<definition>`. The "kv" option definition is not required.
# Description: See Test Cases and Example for details.
# Dependent: each, match_list, var_attrs, array_has_key
# Notice: Only with bash 4.3, there may be something wrong if opts and args are not array.
# ---

# shellcheck disable=2317,1087

_l.parse_args_add_arg() {
  if [[ $__args != _ ]]; then
    eval "$__args+=(\"$1\")"
  fi
}

_l.parse_args_add_opt() {
  if [[ $__opts != _ ]]; then
    local str=${opt_props_map[alias:$1]:-}

    if [[ -z $str ]]; then
      eval "$__opts[$1]=\"$2\""
    else
      # all alias options will be assign same value
      local -a names
      local v name i
      IFS=' ' read -r -a names <<<"$str"

      for (( i = 0; i < ${#names[@]}; i++ )); do
        v=${names[i]}
        if [[ $v == --* ]]; then
          name="${v:2}"
        elif [[ $v == -* ]]; then
          name="${v:1}"
        fi
        eval "$__opts[$name]=\"$2\""
      done
    fi
  fi
}

_l.parse_args_get_opt_val() {
  # shellcheck disable=1083
  eval "echo "\${"$__opts"["$1"]:-}""
}

# Possible Formats:
# -a 3 or -abc 3
# -a or -a3 or -abc3
# -a=3 or -abc=3
# -a= or -abc=
# -a -3 or -a -b
# -a --
_l.parse_args_single_hyphen_options() {
  local opt=${1#-}
  local next=${2:-}

  local -a matches=()
  local k

  if ((${#opt} > 1)); then
    # -abc=3 or -abc= or -f=abc or -abc 3 or -abc -d

    # find the position of equal symbol (=)
    local prefix="${opt%%=*}"
    local end

    if [[ $prefix == "$opt" ]]; then
      # -abc 3 or -abc -d
      end=$((${#opt} - 1))

      # The front letters always be true
      for ((k = 0; k < end; k++)); do
        _l.parse_args_single_hyphen_options "-${opt:k:1}"
      done

      # put the latest letter to parse again
      if (( $# > 1)); then
        _l.parse_args_single_hyphen_options "-${opt:k:1}" "$next"
      else
        _l.parse_args_single_hyphen_options "-${opt:k:1}"
      fi
    else
      # -abc=3 or -abc= or -f=abc
      end=$((${#prefix} - 1))
      # The front letters always be true
      for ((k = 0; k < end; k++)); do
        _l.parse_args_single_hyphen_options "-${opt:k:1}"
      done

      _l.parse_args_single_hyphen_options "-${opt:k:1}" "${opt:k+2}"
    fi
  else
    # -a=3 or -a= or -a 3 or -a or -a -b or -a --
    l.match_list "$opt" '^(.+)=(.*)$' matches

    if ((${#matches[@]} == 2)); then
      # -a=3 or -a=
      # shellcheck disable=2154
      _l.parse_args_add_opt "${matches[0]}" "${matches[1]}"
    else
      # -a 3 or -a or -a -b or -a abc
      if [[ ${opt_props_map["bool:${opt}"]:-} == true ]]; then
        _l.parse_args_add_opt "${opt}" true
      elif [[ ${opt_props_map["count:${opt}"]:-} == true ]]; then
        _l.parse_args_add_opt "${opt}" "\$((\${$__opts[$opt]:-0} + 1))"
      elif [[ $next == -- ]]; then
        # -a --
        echo "Error: Missing parameter for the option '-${opt}'" >&2
        return 6
      else
        if (( $# > 1)); then
          _l.parse_args_add_opt "${opt}" "$next"
          ((i += 1))
        else
          echo "Error: Missing parameter for the option '-${opt}'" >&2
          return 5
        fi
      fi
    fi
  fi
}

# Possible Formats:
# --opt value
# --opt=value or --opt=
# --opt
# --no-opt
# --opt -- or --no-opt --
_l.parse_args_double_hyphen_options() {
  local param=$1
  local next=${2:-}

  local -a matches=()
  local opt=${param#--no-}
  opt=${opt#--}

  if [[ ${opt_props_map["bool:${opt}"]:-} == true ]]; then
    # opt_type=bool
    if [[ $param == --no-* ]]; then
      # --no-opt
      _l.parse_args_add_opt "${opt}" false
    else
      _l.parse_args_add_opt "${opt}" true
    fi
  elif [[ ${opt_props_map["count:${opt}"]:-} == true ]]; then
    # opt_type=count
    _l.parse_args_add_opt "${opt}"  "\$((\${$__opts[$opt]:-0} + 1))"
  else
    # opt_type=kv

    if [[ $param =~ ^--([^=]+)=(.*) ]]; then
      # --opt=value or --opt=
      _l.parse_args_add_opt "${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}"
    elif [[ $next == -- ]]; then
      # --opt --
      echo "Error: Missing parameter for the option '--${opt}'" >&2
      return 7
    else
      if (( $# > 1)); then
        # --opt value
        _l.parse_args_add_opt "${opt}" "${next}"
        ((i += 1))
      else
        # --opt
        echo "Error: Missing parameter for the option '--${opt}'" >&2
        return 8
      fi
    fi
  fi
}

# @param val
# @param key  the format: ['-f --flag']='bool default:1' ['-b']='bool'
_l.parse_args_def() {
  local key=$2
  if [[ $key == opts || $key == args ]]; then return ; fi

  local val=$1
  local -a names props
  local v name i

  IFS=' ' read -r -a names <<<"$key"
  IFS=' ' read -r -a props <<<"$val"

  for (( i = 0; i < ${#names[@]}; i++ )); do
    v=${names[i]}
    if [[ $v == --* ]]; then
      name="${v:2}"
    elif [[ $v == -* ]]; then
      name="${v:1}"
    fi
    names[i]="$name"
    opt_props_map[alias:$name]=$key
  done

  for v in "${props[@]}"; do
    case $v in
      bool)
        for name in "${names[@]}"; do
          opt_props_map[bool:${name}]=true
        done
        ;;

      count)
        for name in "${names[@]}"; do
          opt_props_map[count:${name}]=true
        done
        ;;

      default:*)
        for name in "${names[@]}"; do
          opt_props_map[default:${name}]=${v#default:}
        done
        ;;
    esac
  done
}

_l.parse_args_handle_rest() {
  local val=$1
  local key=$2

  if [[ $key == default:* ]]; then
    if ! l.array_has_key "$__opts" "${key#default:}" ; then
      _l.parse_args_add_opt "${key#default:}" "$val"
    fi
  elif [[ $key == bool:* ]]; then
    if ! l.array_has_key "$__opts" "${key#bool:}" ; then
      _l.parse_args_add_opt "${key#bool:}" false
    fi
  elif [[ $key == count:* ]]; then
    if ! l.array_has_key "$__opts" "${key#count:}" ; then
    _l.parse_args_add_opt "${key#count:}" 0
    fi
  fi
}

_l.parse_args_init() {
  # Check "opts" and "args" defined in params_def
  __opts=$(eval "echo "\${"$1"[opts]:-}"")
  __args=$(eval "echo "\${"$1"[args]:-}"")

  if [[ -z $__opts ]]; then
    echo "Error: l.parse_args: [opts] is not defined in params_def" >&2
    return 3
  elif [[ $__opts != _ ]]; then
    local attrs
    attrs=$(l.var_attrs "$__opts")
    if [[ ! ${attrs} =~ A ]]; then
      echo "Error: l.parse_args: not found associative array '$__opts' for [opts]=$__opts" >&2
      return 5
    fi
  fi

  if [[ -z $__args ]]; then
    echo "Error: l.parse_args: [args] is not defined in params_def" >&2
    return 4
  elif [[ $__args != _ ]]; then
    local attrs
    attrs=$(l.var_attrs "$__args")
    if [[ ! ${attrs} =~ a ]]; then
      echo "Error: l.parse_args: not found array '$__args' for [args]=$__args" >&2
      return 6
    fi
  fi

  # clean the array
  if [[ $__opts != _ ]]; then eval "$__opts=()"; fi
  if [[ $__args != _ ]]; then eval "$__args=()"; fi
}

# Usage: l.parse_args params_def "$@"
l.parse_args() {
  local -A opt_props_map=()
  local __opts __args

  _l.parse_args_init "$1"

  l.each "$1" _l.parse_args_def
  # declare -p opt_props_map
  shift 1

  local cur param_size=$# i

  # parse arguments
  for ((i = 1; i <= param_size; i++)); do
    cur=${!i}

    case "$cur" in

      --*)
        if [[ $cur == '--' ]]; then
          # the rest parameters are arguments
          ((i += 1))
          for (( ; i <= param_size; i++)); do
            # shellcheck disable=2154
            _l.parse_args_add_arg "${!i}"
          done
          break
        fi

        local j=$((i + 1))

        if ((j >= param_size)); then
          _l.parse_args_double_hyphen_options "$cur" true
        else
          _l.parse_args_double_hyphen_options "$cur" "${!j}"
        fi

        ;;

      -*)
        local j=$((i + 1))

        if ((j > param_size)); then
          _l.parse_args_single_hyphen_options "$cur" true
        else
          _l.parse_args_single_hyphen_options "$cur" "${!j}"
        fi

        ;;

      *) _l.parse_args_add_arg "$cur" ;;
    esac
  done

  l.each opt_props_map _l.parse_args_handle_rest
}
