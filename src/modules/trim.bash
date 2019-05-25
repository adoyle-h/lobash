trim_start() {
  echo "${1##*( )}"
}

trim_end() {
  echo "${1%%*( )}"
}

trim() {
  trim_end "$(trim_start "$1")"
}
