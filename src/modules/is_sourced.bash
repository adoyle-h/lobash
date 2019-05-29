# ---
# Category: Condition
# Since: 0.1.0
# ---

# USAGE: is_sourced
is_sourced() {
  if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo false
  else
    echo true
  fi
}
