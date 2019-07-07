# ---
# Category: Console
# Since: 0.2.0
# Usage: l.echo_screen <string>...
# Description: Similar to l.echo, but always print text to screen no matter redirection.
# Description: If no screen, it will print nothing.
# ---

l.echo_screen() {
  # /dev/tty may not exist when run in interactive shell
  (printf -- '%b\n' "$*" >/dev/tty || true) 2>/dev/null
}
