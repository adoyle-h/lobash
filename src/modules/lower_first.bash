# ---
# Category: String
# Since: 0.1.0
# Usage: l.lower_first <string>
# Usage: echo <string> | l.lower_first
# ---

# CAVEAT: Requires bash 4+
l.lower_first() {
  local str
  if [[ -t 0 ]]; then
    str=$1
  else
    IFS='' read -r str
  fi

  printf '%s\n' "${str,}"
}
