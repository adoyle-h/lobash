# ---
# Category: Path
# Since: 0.1.0
# Usage: echo <path> | l.dirname.p
# Description: The pipeline version of l.dirname
# ---

l.dirname.p() {
  local str
  IFS='' read -r str
  _lobash.dirname "$str"
}
