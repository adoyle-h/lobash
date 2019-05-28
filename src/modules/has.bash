# ---
# Category: Condition
# Since: 0.1.0
# ---

has() {
  local condition="$1"
  local value="$2"

  if [[ "$condition" == "not" ]]; then
    shift 1
    ! has "${@}"
    return $?
  fi

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
      # Invalid Condition
      return 2;;
  esac > /dev/null

  return 1
}
