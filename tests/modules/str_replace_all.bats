#!/usr/bin/env bats

setup_fixture

@test "l.str_replace_all asd" {
  run l.str_replace_all "/qwe/asd/zxc/asd" "asd" "---"
  assert_success
  assert_output '/qwe/---/zxc/---'
}

@test "l.str_replace_all 'as d'" {
  run l.str_replace_all "/qwe/as d/zxc/as d" "as d" "---"
  assert_success
  assert_output '/qwe/---/zxc/---'
}

@test "l.str_replace_all #asd" {
  run l.str_replace_all "asd/zxc/asd" "#asd" "---"
  assert_success
  assert_output 'asd/zxc/asd'

  run l.str_replace_all "#asd/zxc/#asd" "#asd" "---"
  assert_success
  assert_output '---/zxc/---'
}

@test "l.str_replace_all %asd" {
  run l.str_replace_all "/qwe/asd" "%asd" "---"
  assert_success
  assert_output '/qwe/asd'

  run l.str_replace_all "%asd/zxc/%asd" "%asd" "---"
  assert_success
  assert_output '---/zxc/---'
}

@test "l.str_replace_all /asd" {
  run l.str_replace_all "/qwe/asd/zxc/asd" "/asd" "---"
  assert_success
  assert_output '/qwe---/zxc---'
}
