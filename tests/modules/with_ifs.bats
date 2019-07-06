#!/usr/bin/env bats

setup_fixture
test_prepare with_ifs
load_module with_ifs

@test "echo y | l.ask_input hello" {
  skip 'How to assert default value of $IFS?'
  ifs=$IFS
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
  local t=$' \t\n'
  assert_line -n 0 "IFS=$ifs"
  assert_line -n 1 '3'
  assert_line -n 2 "IFS=$ifs"
  assert_line -n 3 '3'
  assert_line -n 4 'IFS=,'
}
