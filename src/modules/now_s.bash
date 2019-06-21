# ---
# Category: Time
# Since: 0.1.0
# Usage: l.now_s
# Description: Print the timestamp of the number of seconds that have elapsed since the Unix epoch (1 January 1970 00:00:00 UTC).
# Dependent: date
# ---

l.now_s() {
  l.date '%s'
}
