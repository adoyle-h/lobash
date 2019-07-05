# ---
# Category: Time
# Since: 0.1.0
# Usage: l.date [<format>=]
# Description: Refer to 'man strftime' for `<format>`.
# Bash: 4.2
# ---

# Reference: https://github.com/dylanaraps/pure-bash-bible#get-the-current-date-using-strftime
l.date() {
  # %(datefmt)T : Causes printf to output the date-time string resulting from using datefmt as a
  # format string for strftime(3). The corresponding argument is an integer representing the number
  # of seconds since the epoch. Two special argument values may be used: -1 represents the
  # current time, and -2 represents the time the shell was invoked. If no argument is specified,
  # conversion behaves as if -1 had been given. This is an exception to the usual printf behavior.
  printf "%($1)T\\n" "-1"
}
