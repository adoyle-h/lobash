# ---
# Category: Console
# Since: 0.1.0
# ---

# Usage: l.echo any string
# Description: A safe way to echo string
l.echo() {
  printf '%b\n' "$*"
}
