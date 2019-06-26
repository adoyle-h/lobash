# ---
# Category: File
# Since: 0.1.0
# Usage: l.extname <path>
# Description: Returns the extension of the path, from the last occurrence of the . (period) character to end of string in the last portion of the path. If there is no . in the last portion of the path, or if the first character of the basename of path (see path.basename()) is ., then an empty string is returned.
# ---

l.extname() {
  local path=${1:-}
  [[ $path =~ ^\. ]] && echo '' && return
  [[ ! $path =~ \. ]] && echo '' && return
  echo ".${path##*.}"
}
