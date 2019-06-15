# ---
# Category: Debug
# Since: 0.1.0
# Usage: l.trace_end
# Description: Close xtrace mode and reset PS4. Cooperated with trace_start.
# ---

l.trace_end() {
  set +o xtrace
  PS4=${_l_trace_start_old_ps4:-$PS4}
}
