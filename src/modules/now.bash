# ---
# Category: Time
# Since: 0.1.0
# Usage: l.now
# Description: Print the timestamp of the number of milliseconds that have elapsed since the Unix epoch (1 January 1970 00:00:00 UTC).
# ---

l.now() {
  # +%N not supported in MacOS.
  # date '+%s%3N'

  # Perl is ubiquitous.
  perl -MTime::HiRes=time -e 'printf "%d\n", time * 1000'
}
