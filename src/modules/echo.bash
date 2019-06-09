# ---
# Category: Console
# Since: 0.1.0
# Usage: l.echo <string>...
# Description: A safe way to echo string. Not support any options.
# Description: The builtin echo will get unexpected result while execute `b=( -n 123 ); echo "${b[@]}"`.
# Description: See https://github.com/anordal/shellharden/blob/master/how_to_do_things_safely_in_bash.md#echo--printf
# ---

l.echo() {
  printf -- '%b\n' "$*"
}
