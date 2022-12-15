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

assert_output_text() {
  local text="${1:-$(cat -)}"
  local text_lines=0

  while read -r -d $'\n' _; do
    ((text_lines+=1))
  done <<<"$text"

  # shellcheck disable=2154
  assert_equal "$output" "$text"
  # shellcheck disable=2154
  assert_equal "${#lines[@]}" "$text_lines"
}

assert_lines_size() {
  assert_equal "${#lines[@]}" "$1"
}
