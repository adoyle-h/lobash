# ---
# Category: Array
# Since: 0.3.1
# Usage: l.array_include <array_name> <match>
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.array_include() {
  local _exit_code_
  eval "(( \${#${1}[@]} == 0 )) && _exit_code_=1 || true"
  [[ -n ${_exit_code_:-} ]] && return "$_exit_code_"

  local _e_

  eval "for _e_ in \"\${${1}[@]}\"; do [[ \"\$_e_\" == \"$2\" ]] && _exit_code_=0 && return 0; done"
  [[ -n ${_exit_code_:-} ]] && return "$_exit_code_" || return 1
}
