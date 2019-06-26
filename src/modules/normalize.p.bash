# ---
# Category: Path
# Since: 0.1.0
# Usage: echo <path> | l.normalize.p
# Description: The pipeline version of l.normalize
# Dependent: normalize
# ---

l.normalize.p() {
  local path
  IFS='' read -r path
  l.normalize "$path"
}
