# ---
# Category: Util
# Since: next
# Usage: l.rm <filepath>
# Description: safely remove file
# Dependent: normalize
# Dependent_Internal: rm
# ---

l.rm() {
  local path=$1
  path=$(l.normalize "$path")
  _lobash.rm "$path"
}
