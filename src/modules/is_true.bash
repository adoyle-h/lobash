# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_true <var>
# ---

l.is_true() {
  if [[ $1 == true ]] || [[ $1 == 0 ]]; then
    echo true
  else
    echo false
  fi
}