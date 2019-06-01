# ---
# Category: File
# Since: 0.1.0
# ---

# Usage: l.extname string
l.extname() {
  [[ $1 =~ ^\. ]] && echo '' && return
  [[ ! $1 =~ \. ]] && echo '' && return
  echo ".${1##*.}"
}
