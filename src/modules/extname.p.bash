# ---
# Category: File
# Since: 0.1.0
# Usage: echo <path> | l.extname.p
# Description: The pipeline of l.extname
# Dependent: extname
# ---

l.extname.p() {
  local path
  IFS='' read -r path
  l.extname "$path"
}
