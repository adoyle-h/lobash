# ---
# Category: File
# Since: 0.1.0
# ---

# Usage: extname string
extname() {
  [[ $1 =~ ^\. ]] && echo '' && return
  [[ ! $1 =~ \. ]] && echo '' && return
  echo ".${1##*.}"
}
