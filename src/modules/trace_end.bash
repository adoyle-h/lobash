# ---
# Category: Debug
# Since: 0.1.0
# Usage: l.trace_end
# Description: Close xtrace mode and reset PS4. Cooperated with trace_start.
# ---

l.trace_end() {
  set +o xtrace
  PS4=${_L_TRACE_OLD_PS4:-$PS4}
}
