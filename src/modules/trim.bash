trim_start() {
  echo "${1#"${1%%[![:space:]]*}"}"
}

trim_end() {
  echo "${1%"${1##*[![:space:]]}"}"
}

trim() {
  trim_end "$(trim_start "$1")"
}
