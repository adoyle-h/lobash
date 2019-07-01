# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.if <condition> <then> [<else>]
# Description: The difference from shell builtin `if` is when condition function throw exception it will ended immediately.
# Description: `<condition>` can be function name, string and number. The function should return `true`/`0` or `false`/`1`.
# Description: `<then>` and `<else>` must be function name. And `<else>` is optional.
# Description: When `<condition>` is true, `<then>` function will be invoked. Otherwise `<else>` will be invoked if it passed.
# ---

l.if() {
  local condition
  if [[ $(type -t "$1") == function ]]; then
    condition=$($1)
  else
    condition=$1
  fi

  if [[ $condition == true ]] || [[ $condition == 0 ]]; then
    $2
  elif [[ $condition == false ]] || [[ $condition == 1 ]]; then
    ${3:-}
  else
    echo "Invalid condition: $condition"
    return 3
  fi
}
