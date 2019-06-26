# ---
# Category: System
# Since: 0.1.0
# Usage: l.hostname
# Description: Return current hostname.
# ---

l.hostname() {
  printf '%s\n' "${HOSTNAME:-$(hostname)}"
}
