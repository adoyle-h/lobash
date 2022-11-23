# ---
# Category: Condition
# Since: 0.5.0
# Usage: l.is_tty_available.s
# Description: Whether /dev/tty is available
# Description: This function always echo `true` or `false` and exit code always be 0.
# ---

l.is_tty_available.s() {
  _lobash.is_tty_available && echo true || echo false
}
