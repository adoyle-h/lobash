# ---
# Category: System
# Since: 0.1.0
# Usage: l.hostname
# ---

l.hostname() {
  printf '%s\n' "${HOSTNAME:-$(hostname)}"
}
