# shellcheck source=./check_shell.bash
# shellcheck source=./dirname.bash
# shellcheck source=./detect_os.bash
# shellcheck source=./is_bash.bash
# shellcheck source=./consts.bash
# shellcheck source=./debug.bash
# shellcheck source=./warn.bash
# shellcheck source=./error.bash
# shellcheck source=./import.bash
# shellcheck source=./is_tty_available.bash
# shellcheck source=./rm.bash
_LOBASH_BASIC_INTERNALS=(
  detect_os
  consts
  is_bash
  check_support
  dirname
  debug
  warn
  error
  import
  with_ifs
  is_tty_available
  is_gnu_sed
  rm
)

# for build Lobash
_LOBASH_DIST_INTERNALS=(
  # detect_os must be put before consts
  detect_os
  # consts must be second
  consts
  is_bash
  check_support
  dirname
  with_ifs
  is_tty_available
  is_gnu_sed
  rm
)
