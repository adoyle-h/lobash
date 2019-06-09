# ---
# Category: Path
# Since: 0.1.0
# Usage: l.basename <path>
# Usage: echo <path> | l.basename
# Description: Alternative to basename command. It much faster because using shell parameter expansion.
# ---

l.basename() {
  local str
  if [[ -t 0 ]]; then
    str=$1
  else
    IFS='' read -r str
  fi

  : "${str%/}"
  printf '%s\n' "${_##*/}"
}
