# ---
# Category: Path
# Since: 0.1.0
# Usage: l.dirname <path>
# Usage: echo <path> | l.dirname
# Description: Alternative to dirname command. It much faster because using shell parameter expansion.
# ---

l.dirname() {
  local str
  if [[ -t 0 ]]; then
    str=$1
  else
    IFS='' read -r str
  fi

  _lobash.dirname "$str"
}
