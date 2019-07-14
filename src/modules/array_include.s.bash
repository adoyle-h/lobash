# ---
# Category: Array
# Since: 0.3.1
# Usage: l.array_include.s <array_name> <match>
# Description: This function always echo `true` or `false` and exit code always be 0.
# ---

l.array_include.s() {
  local array_name=$1
  local exit_code
  eval "(( \${#${array_name}[@]} == 0 )) && echo false && exit_code=1 || true"
  [[ -n ${exit_code:-} ]] && return 0

  local match="$2"
  local e
  shift

  eval "for e in \"\${${array_name}[@]}\"; do [[ \"\$e\" == \"\$match\" ]] && echo true && exit_code=0 && return 0; done || true"

  [[ -z ${exit_code:-} ]] && echo "false" || return 0
}
