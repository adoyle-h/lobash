# ---
# Category: Array
# Since: 0.1.0
# Usage: l.first <array_name> [<count>=1]
# Description: Return the first values of array.
# ---

l.first() {
  local _size_
  _size_=$(eval "echo \${#${1}[@]}")
  if (( _size_ == 0 )); then
    echo ''
  else
    eval "printf '%s\\n' \"\${${1}[@]:0:${2:-1}}\""
  fi
}
