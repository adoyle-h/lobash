# ---
# Category: System
# Since: 0.1.0
# Usage: l.sleep <number_or_float>
# Description: Same to sleep command but support float
# ---

l.sleep() {
  read -rst "${1:-1}" -N 99999 || true
}

# Refer to below links
# - https://blog.dhampir.no/content/sleeping-without-a-subprocess-in-bash-and-how-to-sleep-forever
# - https://bash.cyberciti.biz/guide/Opening_the_file_descriptors_for_reading_and_writing
# - https://bash.cyberciti.biz/guide/Closes_the_file_descriptor_(fd)
# - https://bash.cyberciti.biz/guide/Reads_from_the_file_descriptor_(fd)
l.sleep.next() {
  local IFS
  local _sleep_fd
  temp=$(mktemp)
  # exec {_sleep_fd}<> <(true)
  exec {_sleep_fd}<>"$temp"

  # wait for timeout
  read -rst "${1:-1}" -u "$_sleep_fd" || true

  # close fd
  exec {_sleep_fd}<&-
}
