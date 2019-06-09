# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.if <condition> <then> <else>
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
