# ---
# Category: Number
# Since: 0.1.0
# Usage: l.is_float <str>
# ---

l.is_float() {
  [[ $1 =~ ^[-+]?[0-9]+([.][0-9]+)?$ ]] && echo true || echo false
}
