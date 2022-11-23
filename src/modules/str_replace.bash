# ---
# Category: String
# Since: 0.5.0
# Usage: l.str_replace <string> <pattern> <replace>
# Description: The first longest match of `<pattern>` is replaced with `<replace>`.
# ---

l.str_replace() {
  local pattern=${2:-}
  if [[ $pattern =~ ^'#' ]]; then pattern="\\$pattern" ; fi
  if [[ $pattern =~ ^'%' ]]; then pattern="\\$pattern" ; fi
  echo "${1/$pattern/${3:-}}"
}
