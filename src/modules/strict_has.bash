# ---
# Category: Condition
# Since: 0.1.0
# ---

strict_has() {
  local condition="$1"
  local value="$2"

  if [[ "$condition" == "not" ]]; then
    shift 1
    if [[ $(strict_has "$@") == true ]]; then
      echo false
    else
      echo true
    fi
    return 0
  fi

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
      # Invalid Condition
      return 2;;
  esac
}
