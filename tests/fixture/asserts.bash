assert_array() {
  local actual=$1
  local expected=$2
  local actual_size expected_size
  expected_size="$(eval "echo \${#${expected}[@]}")"
  actual_size="$(eval "echo \${#${actual}[@]}")"

  assert_equal "$actual_size" "$expected_size"
  for (( i=0 ; i < expected_size ; i++ )); do
    eval "assert_equal \"\${${actual}[i]}\" \"\${${expected}[i]}\""
  done
}
