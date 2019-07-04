# ---
# Category: Prompt
# Since: 0.1.0
# Usage: l.ask_input [<message>='Ask Input:'] [<default>]
# Description: Print a message and read user input from stdin.
# Description: If `<default>` provided, return it when user type empty.
# ---

l.ask_input() {
  local answer prompt
  local default=${2:-}
  if (( $# < 2 )); then
    prompt="${1:-Ask Input:} "
  else
    prompt="${1:-Ask Input:} (Default: $default) "
  fi

  read -rp "$prompt" answer
  printf '%s\n' "${answer:-$default}"
}
