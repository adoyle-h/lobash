#!/usr/bin/env bats

setup_fixture

@test "echo y | l.ask_input hello" {
  t() {
    declare -a k
    echo "IFS=$IFS"

    l.with_ifs ',' 'k=( $(printf '1,2,3') )'

    echo "${#k[@]}"
    echo "IFS=$IFS"

    IFS=',' k=( $(printf '1,2,3') )

    echo "${#k[@]}"
    echo "IFS=$IFS"
  }
  run t
  assert_success

  local ifs=$' \t\n'
  local nl=$'\n'
  assert_output "IFS=${ifs}${nl}3${nl}IFS=$ifs${nl}3${nl}IFS=,"
  # Do not use assert_line because lines has trimmed default IFS $' \t\n' with $'\n'.
  # It will failed ifs=$' \t\n', but success when ifs=$' \t'
  # assert_line -n 0 "IFS=$ifs"
  # assert_line -n 1 '3'
  # assert_line -n 2 "IFS=$ifs"
  # assert_line -n 3 '3'
  # assert_line -n 4 'IFS=,'
}
