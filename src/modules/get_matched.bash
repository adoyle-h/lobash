# ---
# Category: String
# Since: 0.1.0
# Usage: l.get_matched regex [index=1] string
# ---

l.get_matched() {
  if [[ $# == 2 ]]; then
    sed -E "s/${1}/\\1/" <<< "$2"
  else
    sed -E "s/${1}/\\${2}/" <<< "$3"
  fi
}
