# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.strict_has <condition> <what>
# Description: Return `true` or `false`. Check if command/function/alias/keyword/builtin or anything existed.
# Description: `<condition>` Valid value: `command`, `function`, `alias`, `keyword`, `builtin`, `the`
# ---

l.strict_has() {
  local condition="$1"
  local value="$2"

  case "$condition" in
    command)
      [[ -x "$(command -v "$value")" ]] && echo true || echo false;;
    function)
      [[ $(type -t "$value") == function ]] && echo true || echo false;;
    alias)
      [[ $(type -t "$value") == alias ]] && echo true || echo false;;
    keyword)
      [[ $(type -t "$value") == keyword ]] && echo true || echo false;;
    builtin)
      [[ $(type -t "$value") == builtin ]] && echo true || echo false;;
    the)
      type -t "$value" >/dev/null && echo true || echo false;;
    *)
      echo "Invalid Condition: $condition" >&2
      return 3;;
  esac
}
