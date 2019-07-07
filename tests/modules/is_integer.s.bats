#!/usr/bin/env bats

setup_fixture
test_prepare is_integer.s
load_module is_integer.s

@test "l.is_integer.s, integers" {
  run l.is_integer.s 0
  assert_success
  assert_output true

  run l.is_integer.s 1
  assert_success
  assert_output true

  run l.is_integer.s 10
  assert_success
  assert_output true

  run l.is_integer.s 9999
  assert_success
  assert_output true
}

@test "l.is_integer.s, negative integers" {
  run l.is_integer.s -0
  assert_success
  assert_output true

  run l.is_integer.s -1
  assert_success
  assert_output true

  run l.is_integer.s -10
  assert_success
  assert_output true

  run l.is_integer.s -9999
  assert_success
  assert_output true
}

@test "l.is_integer.s, floats" {
  run l.is_integer.s 0.0
  assert_success
  assert_output false

  run l.is_integer.s 0.1
  assert_success
  assert_output false

  run l.is_integer.s 0.10
  assert_success
  assert_output false

  run l.is_integer.s 10.0
  assert_success
  assert_output false

  run l.is_integer.s 99.99
  assert_success
  assert_output false
}

@test "l.is_integer.s, negative floats" {
  run l.is_integer.s -0.0
  assert_success
  assert_output false

  run l.is_integer.s -0.1
  assert_success
  assert_output false

  run l.is_integer.s -0.10
  assert_success
  assert_output false

  run l.is_integer.s -10.0
  assert_success
  assert_output false

  run l.is_integer.s -99.99
  assert_success
  assert_output false
}

@test "l.is_integer.s, a-zA-Z" {
  run l.is_integer.s a
  assert_success
  assert_output false

  run l.is_integer.s z
  assert_success
  assert_output false

  run l.is_integer.s A
  assert_success
  assert_output false

  run l.is_integer.s Z
  assert_success
  assert_output false
}

@test "l.is_integer.s, symbols" {
  run l.is_integer.s -
  assert_success
  assert_output false
}
