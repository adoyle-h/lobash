# ---
# Category: String
# Since: 0.1.0
# Usage: l.str_size <string>
# Description: Return the sum of string letters.
# ---

l.str_size() {
  [[ -z ${1:-} ]] && echo 0 && return

  # It not work with double-width characters when environment LANG is not UTF-8.
  local OLD_LANG
  [[ -n ${LANG:-} ]] && OLD_LANG=$LANG

  LANG=C.UTF-8
  printf '%s\n' "${#1}"

  if [[ -n ${OLD_LANG:-} ]]; then
    LANG=$OLD_LANG
  fi
}
