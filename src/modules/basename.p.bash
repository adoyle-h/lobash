# ---
# Category: Path
# Since: 0.1.0
# Usage: echo <path> | l.basename.p
# Description: The pipeline version of l.basename
# Dependent: basename
# ---

l.basename.p() {
  local str
  IFS='' read -r str

  l.basename "$str"
}
