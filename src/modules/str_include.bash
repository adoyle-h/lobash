# ---
# Category: Condition
# Since: 0.3.1
# Usage: l.str_include <string> <sub-string>
# Description: Return `true` or `false`. Check if a string includes given match string.
# ---

# shellcheck disable=SC2076

l.str_include() {
  [[ ${2:-} == '' ]] && return 0
  [[ "${1:-}" =~ "${2:-}" ]]
}
