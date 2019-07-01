_lobash.dirname() {
  local str=${1:-}
  [[ $str == '/' ]] && echo '/' && return 0
  [[ $str =~ ^'../' ]] && echo '.' && return 0
  [[ ! $str =~ / ]] && echo '.' && return 0

  printf '%s\n' "${str%/*}"
}
