# ---
# Category: System
# Since: 0.1.0
# Usage: l.sleep <number_or_float>
# Description: Same to sleep command but support float.
# Description: When run it in Linux/Unix System, the precision of sleep time is 1ms. The deviation of sleep time is 1~2ms by actual measurement.
# Description: When run it in MacOS, the precision of sleep time is 100ms. The deviation of sleep time is 30~40ms by actual measurement.
# ---

# This way is accurate but has bug. Sleep can be cancelled when stdin get 99999 characters in time.
# l.sleep() {
#   read -rst "${1:-1}" -N 99999 || true
# }

# MacOS will show shows "/dev/fd/62: Permission denied" on `exec {_sleep_fd}<> <(true)`. So we make a workaround.
if [[ $OSTYPE =~ darwin ]]; then
  _l_sleep_temp=$(mktemp -u)
  # Create a FIFO special file
  mkfifo -m 700 "$_l_sleep_temp"
fi

# Refer to below links
# - https://blog.dhampir.no/content/sleeping-without-a-subprocess-in-bash-and-how-to-sleep-forever
# - https://bash.cyberciti.biz/guide/Opening_the_file_descriptors_for_reading_and_writing
# - https://bash.cyberciti.biz/guide/Closes_the_file_descriptor_(fd)
# - https://bash.cyberciti.biz/guide/Reads_from_the_file_descriptor_(fd)
l.sleep() {
  # Reset IFS in case it’s set to something weird.
  local IFS
  local _sleep_fd

  if [[ $OSTYPE =~ darwin ]]; then
    # MacOS will show shows "/dev/fd/62: Permission denied" on `exec {_sleep_fd}<> <(true)`. So we make a workaround.

    # local _l_sleep_temp
    # Get available temp file path
    # _l_sleep_temp=$(mktemp -u)
    # # Create a FIFO special file
    # mkfifo -m 700 "$_l_sleep_temp"
    exec {_sleep_fd}<>"$_l_sleep_temp"
    # rm -f "$_l_sleep_temp"
  else
    exec {_sleep_fd}<> <(true)
  fi

  # Wait for timeout
  read -rst "${1:-1}" -u "$_sleep_fd" || true
  # Close fd
  exec {_sleep_fd}<&-
}
