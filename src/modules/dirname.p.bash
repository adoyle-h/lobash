# ---
# Category: Path
# Since: 0.1.0
# Usage: echo <path> | l.dirname.p
# Description: Alternative to dirname command. It much faster because using shell parameter expansion.
# ---

l.dirname.p() {
  local str
  IFS='' read -r str

  _lobash.dirname "$str"
}
