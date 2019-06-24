# ---
# Category: Stream
# Since: 0.1.0
# Status: not work
# ---

# Usage: _lobash.streamable function_name parameter_size "$@"
# Arguments:
#   - function_name: Call the function_name if not a stream invoke
#   - parameter_size: The parameter size of function_name
#
#   - reducer: Defaults to "_$function_name.streamable". Call the reducer if it is a stream invoke
#              The reducer function should be ($prev_value, $line, $index) => $new_value
# Return: echo the result return from reducer or function_name.
_lobash.streamable() {
  local function_name=$1
  local parameter_size=$2
  local reducer=_$function_name.streamable
  local unstreamable=_$function_name.unstreamable
  local index=0
  local prev=''

  if [[ $# == $(( "$parameter_size" + 1  )) ]]; then
    while read -r line; do
      prev=$($reducer "$prev" "$line" "$index")
      index=$(( "$index" + 1 ))
    done

    printf '%s\n' "$prev"
  else
    $unstreamable "$@"
  fi
}
