# ---
# Category: Util
# Since: 0.1.0
# Usage: l.run <command> [args]...
# Description: run command in command substitution and subshell.
# ---

l.run() {
  if [[ $BASH_SUBSHELL == 0 ]]; then
    echo 'Forbidden invoke l.run in main shell. It only can be used subshell.' >&2
    return 3
  fi

  set -o errexit
  set -o pipefail
  "$@"
}
