# ---
# Category: File
# Since: 0.1.0
# Usage: l.extname <string>
# Usage: echo <string> | l.extname
# ---

l.extname() {
  local str
  if [[ -t 0 ]]; then
    str=$1
  else
    IFS='' read -r str
  fi

  [[ $str =~ ^\. ]] && echo '' && return
  [[ ! $str =~ \. ]] && echo '' && return
  echo ".${str##*.}"
}
