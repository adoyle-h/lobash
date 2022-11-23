#!/usr/bin/env bats

setup_fixture
test_prepare str_replace
load_module str_replace

@test "l.str_replace asd" {
  run l.str_replace "/qwe/asd/zxc/asd" "asd" "---"
  assert_success
  assert_output '/qwe/---/zxc/asd'
}

@test "l.str_replace 'as d'" {
  run l.str_replace "/qwe/as d/zxc/as d" "as d" "---"
  assert_success
  assert_output '/qwe/---/zxc/as d'
}

@test "l.str_replace #asd" {
  run l.str_replace "asd/zxc/asd" "#asd" "---"
  assert_success
  assert_output 'asd/zxc/asd'

  run l.str_replace "#asd/zxc/#asd" "#asd" "---"
  assert_success
  assert_output '---/zxc/#asd'
}

@test "l.str_replace %asd" {
  run l.str_replace "/qwe/asd" "%asd" "---"
  assert_success
  assert_output '/qwe/asd'

  run l.str_replace "%asd/zxc/%asd" "%asd" "---"
  assert_success
  assert_output '---/zxc/%asd'
}

@test "l.str_replace /asd" {
  run l.str_replace "/qwe/asd/zxc/asd" "/asd" "---"
  assert_success
  assert_output '/qwe---/zxc/asd'
}
