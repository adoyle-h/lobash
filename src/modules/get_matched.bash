# Usage: get_matched regex [index=1] string
get_matched() {
  if [[ $# == 2 ]]; then
    sed -E "s/${1}/\\1/" <<< "$2"
  else
    sed -E "s/${1}/\\${2}/" <<< "$3"
  fi
}
