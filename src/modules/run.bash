# ---
# Category: Util
# Since: 0.1.0
# Usage: l.run <command> [args]...
# ---

l.run() {
  set -o errexit
  set -o pipefail
  "$@"
}
