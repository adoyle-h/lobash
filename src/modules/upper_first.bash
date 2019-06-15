# ---
# Category: String
# Since: 0.1.0
# Usage: l.upper_first <string>
# Usage: echo <string> | l.upper_first
# Description: Convert the first character of string to upper case.
# ---

# CAVEAT: Requires bash 4+
l.upper_first() {
  local str
  if [[ -t 0 ]]; then
    str=$1
  else
    IFS='' read -r str
  fi

  printf '%s\n' "${str^}"
}
