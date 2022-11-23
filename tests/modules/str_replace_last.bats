#!/usr/bin/env bats

setup_fixture
test_prepare str_replace_last
load_module str_replace_last

@test "l.str_replace_last asd" {
  run l.str_replace_last "/qwe/asd/zxc/asd" "asd" "---"
  assert_success
  assert_output '/qwe/asd/zxc/---'
}

@test "l.str_replace_last 'as d'" {
  run l.str_replace_last "/qwe/as d/zxc/as d" "as d" "---"
  assert_success
  assert_output '/qwe/as d/zxc/---'
}

@test "l.str_replace_last #asd" {
  run l.str_replace_last "asd/zxc/asd" "#asd" "---"
  assert_success
  assert_output 'asd/zxc/asd'

  run l.str_replace_last "#asd/zxc/#asd" "#asd" "---"
  assert_success
  assert_output '#asd/zxc/---'
}

@test "l.str_replace_last %asd" {
  run l.str_replace_last "/qwe/asd" "%asd" "---"
  assert_success
  assert_output '/qwe/asd'

  run l.str_replace_last "%asd/zxc/%asd" "%asd" "---"
  assert_success
  assert_output '%asd/zxc/---'
}

@test "l.str_replace_last /asd" {
  run l.str_replace_last "/qwe/asd/zxc/asd" "/asd" "---"
  assert_success
  assert_output '/qwe/asd/zxc---'
}
