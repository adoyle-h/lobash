# ---
# Category: String
# Since: 0.1.0
# Usage: l.count_lines <string>
# Usage: echo <string> | l.count_lines
# Description: The command and process substitution always trim blank line. So l.count_lines do not accept normal parameter passing.
# Description: Refer to https://stackoverflow.com/a/37706905
# ---

l.count_lines() {
  if [[ -t 0 ]]; then
    [[ -z ${1:-} ]] && printf '0\n' && return 0
    wc -l <<< "$1" | tr -d ' '
  else
    local count=0
    while read -r -d $'\n' _; do
      ((count+=1))
    done
    printf '%s\n' "$count"
  fi
}
