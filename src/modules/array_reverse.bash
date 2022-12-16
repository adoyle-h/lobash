# ---
# Category: Array
# Since: 0.6.0
# Usage: l.array_reverse <input_array_name> <output_array_name>
# Usage: l.read_array <output_array_name> < <(l.array_reverse <input_array_name>)
# Description: Reverse array `<input_array_name>`.
# Description: If `<output_array_name>` set, store the reversed results in `<output_array_name>`.
# Description: Otherwise, print the reversed results to stdout.
# Description: You can use `l.read_array out < <(l.array_reverse <input_array_name>)` to read array.
# Notice: When in subshell, you must call `l.array_reverse <input_array_name>`.
# Notice: The `l.array_reverse <input_array_name> <output_array_name>` not works in subshell.
# ---

l.array_reverse() {
  # shellcheck disable=2034
  local _size_ _idx_
  _size_=$(eval "echo \${#$1[@]}")

  if (( $# > 1 )); then
    eval "for _idx_ in {0..$(( _size_ - 1 ))}; do ${2}[\$(( $(( _size_ - 1 )) - _idx_ ))]=\${${1}[\$_idx_]}; done"
  else
    eval "for _idx_ in {$(( _size_ - 1 ))..0..-1}; do echo \${${1}[\$_idx_]}; done"
  fi
}
