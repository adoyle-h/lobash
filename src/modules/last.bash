# ---
# Category: Array
# Since: 0.1.0
# Usage: l.last <array_name> [<count>=1]
# Description: Return the last values of array.
# ---

l.last() {
  local _count_=${2:-1}
  local _size_
  _size_=$(eval "echo \${#${1}[@]}")

  if (( _size_ > 0 )); then
    if (( _count_ < _size_ )); then
      eval "printf '%s\\n' \"\${${1}[@]: -${_count_}:${_count_}}\""
    else
      eval "printf '%s\\n' \"\${${1}[@]}\""
    fi
  fi
}
