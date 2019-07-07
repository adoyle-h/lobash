# ---
# Category: String
# Since: 0.1.0
# Usage: l.trim_color <string>
# Description: Remove color escape code in string
# ---

# [[ $'\e' == $'\u001b' ]] is false in Bash less than 4.2.
_L_TRIM_COLOR_ECS=$'\e'
_L_TRIM_COLOR_ECS2=$'\u001b'
if [[ "$_L_TRIM_COLOR_ECS" == "$_L_TRIM_COLOR_ECS2" ]]; then
  if [[ $_LOBASH_OS == Linux ]]; then
    _L_TRIM_COLOR_REGEX=$_L_TRIM_COLOR_ECS
  elif [[ $_LOBASH_OS == MacOS ]] || [[ $_LOBASH_OS == BSD ]]; then
    _L_TRIM_COLOR_REGEX="\\$_L_TRIM_COLOR_ECS"
  fi
else
  if [[ $_LOBASH_OS == Linux ]]; then
    _L_TRIM_COLOR_REGEX="($_L_TRIM_COLOR_ECS|\\$_L_TRIM_COLOR_ECS2)"
  elif [[ $_LOBASH_OS == MacOS ]] || [[ $_LOBASH_OS == BSD ]]; then
    _L_TRIM_COLOR_REGEX="(\\$_L_TRIM_COLOR_ECS|\\$_L_TRIM_COLOR_ECS2)"
  fi
fi

l.trim_color() {
  ( (( $# == 0 )) || [[ -z ${1:-} ]]) && echo '' && return
  sed -E "s,${_L_TRIM_COLOR_REGEX}[[0-9]*(;[0-9]+)*m,,g" <<< "$1"
}
