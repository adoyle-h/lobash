# ---
# Category: String
# Since: 0.1.0
# Usage: l.str_len <string>
# Description: Return the byte length of string.
# ---

l.str_len() {
  [[ -z ${1:-} ]] && echo 0 && return

  local old_lang old_lc_all bytlen
  [[ -n ${LC_ALL:-} ]] && old_lc_all=$LC_ALL
  [[ -n ${LANG:-} ]] && old_lang=$LANG

  LANG=C LC_ALL=C
  bytlen=${#1}
  printf -- '%s\n' "$bytlen"

  [[ -n ${old_lang:-} ]] && LANG=$old_lang
  if [[ -n ${old_lc_all:-} ]]; then
    LC_ALL=$old_lc_all
  fi
}
