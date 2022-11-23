# ---
# Category: Condition
# Since: 0.3.0
# Usage: l.has <condition> <what>
# Description: Exit with 0 or 1. Check if command/function/alias/keyword/builtin or anything existed.
# Description: `<condition>` Valid value: `command`, `function`, `alias`, `keyword`, `builtin`, `the`
# ---

# Reference: https://github.com/qzb/is.sh/blob/master/is.sh
l.has() {
  local condition="$1"
  local value="$2"

  case "$condition" in
    command)
      [[ -x "$(command -v "$value")" ]] && return 0;;
    function)
      [[ $(type -t "$value") == function ]] && return 0;;
    alias)
      [[ $(type -t "$value") == alias ]] && return 0;;
    keyword)
      [[ $(type -t "$value") == keyword ]] && return 0;;
    builtin)
      [[ $(type -t "$value") == builtin ]] && return 0;;
    the)
      type -t "$value"
      return $?;;
    *)
      echo "Invalid Condition: $condition" >&2
      return 3;;
  esac > /dev/null

  return 1
}
