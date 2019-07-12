# ---
# Category: Array
# Since: 0.1.0
# Usage: l.array_include <array_name> <match>
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.array_include() {
  local array_name=$1
  local exit_code
  eval "(( \${#${array_name}[@]} == 0 )) && exit_code=1 || true"
  [[ -n ${exit_code:-} ]] && return "$exit_code"

  local match="$2"
  local e
  shift

  eval "for e in \"\${${array_name}[@]}\"; do [[ \"\$e\" == \"\$match\" ]] && exit_code=0 && return 0; done"
  [[ -n ${exit_code:-} ]] && return "$exit_code" || return 1
}
