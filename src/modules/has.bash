# ---
# Category: Condition
# Since: 0.1.0
# ---

has() {
  local condition="$1"
  local value="$2"

  if [ "$condition" == "not" ]; then
    shift 1
    if [[ $(has "$@") == true ]]; then
      echo false
    else
      echo true
    fi
    return 0
  fi

  case "$condition" in
    command)
      [[ -x "$(command -v "$value")" ]] && echo true && return 0;;
  esac

  echo false
}
