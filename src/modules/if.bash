# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.if <condition> <then> <else>
# ---

l.if() {
  $1
  if $?; then
    $2
  else
    ${3:-}
  fi
}
