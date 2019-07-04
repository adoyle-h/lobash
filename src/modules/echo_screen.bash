# ---
# Category: Console
# Since: 0.1.0
# Usage: l.echo_screen <string>...
# Description: Similar to l.echo, but always print text to screen no matter redirection.
# Description: If no screen, it will print nothing.
# ---

l.echo_screen() {
  if [[ -c /dev/tty ]]; then
    printf -- '%b\n' "$*" >/dev/tty
  fi
}
