# ---
# Category: String
# Since: 0.1.0
# Usage: l.str_len <string>
# Description: Return the byte length of string.
# ---

l.str_len() {
  local oLang oLcAll bytlen
  [[ -n ${LC_ALL:-} ]] && oLcAll=$LC_ALL
  [[ -n ${LANG:-} ]] && oLang=$LANG

  LANG=C LC_ALL=C
  bytlen=${#1}

  [[ -n ${oLang:-} ]] && LANG=$oLang
  [[ -n ${oLcAll:-} ]] && LC_ALL=$oLcAll

  printf -- '%s\n' "$bytlen"
}
