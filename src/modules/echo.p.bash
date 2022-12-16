# ---
# Category: Console
# Since: 0.6.0
# Usage: printf '%s\n' {01..10} | l.echo.p
# Description: Just print each line from pipe. It can be used for functional programming.
# ---

l.echo.p() {
  local _l_
  while read -r _l_; do
    printf -- '%b\n' "$_l_"
  done
}
