# ---
# Category: Number
# Since: 0.1.0
# Usage: l.is_integer <str>
# ---

l.is_integer() {
  [[ $1 =~ ^[-+]?[0-9]+$ ]] && echo true || echo false
}
