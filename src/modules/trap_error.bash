# ---
# Category: Util
# Since: 0.5.0
# Usage: l.trap_error [trap_handler=_l.trap_error]
# Description: Show error line number of file when program exited by error.
# Description: Make sure `set -o errtrace` and `set -o errexit` before using l.trap_error.
# Description: You can change trap handler to your own function.
# ---

# https://stackoverflow.com/a/35800451/4622308
# https://unix.stackexchange.com/a/250533/373303
_l.trap_error() {
  echo "Error occurred. Error Stacks:" >&2

  local frame=0 LINE FUNC FILE
  while read -r LINE FUNC FILE < <(caller "$frame"); do
    printf -- '  - %s (%s:%s)\n' "${FUNC}" "${FILE}" "${LINE}"
    frame=$(( frame + 1 ))
  done
}

l.trap_error() {
  local trap_func=${1:-_l.trap_error}
  # shellcheck disable=SC2064
  trap "$trap_func" ERR
}
