# ---
# Category: String
# Since: 0.1.0
# Usage: str_include <string> <sub-string>
# Description: Return `true` or `false`. Check if a string includes given match string.
# ---

# shellcheck disable=SC2076

l.str_include() {
  [[ "$1" =~ "$2" ]] && echo true || echo false;
}
