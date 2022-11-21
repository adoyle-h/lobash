#!/usr/bin/env bats

setup_fixture
test_prepare is_array.s
load_module is_array.s

@test "l.is_array.s array" {
  local -a y=(a h)
  run l.is_array.s y
  assert_success
  assert_output true
}

@test "l.is_array uninitialized array" {
  local -a x
  run l.is_array.s x
  assert_success
  assert_output true
}

@test "l.is_array.s number" {
  local -i y=1
  run l.is_array.s y
  assert_success
  assert_output false
}

@test "l.is_array.s string" {
  local y=string
  run l.is_array.s y
  assert_success
  assert_output false
}

@test "l.is_array.s ''" {
  run l.is_array.s ''
  assert_success
  assert_output false
}

@test "l.is_array.s" {
  run l.is_array.s
  assert_success
  assert_output false
}

@test "l.is_array.s undefined variable" {
  run l.is_array.s k
  assert_success
  assert_output false
}
