#!/usr/bin/env bats

setup_fixture
test_prepare is_number.s
load_module is_number.s

@test "l.is_number.s, integers" {
  run l.is_number.s 0
  assert_success
  assert_output true

  run l.is_number.s 1
  assert_success
  assert_output true

  run l.is_number.s 10
  assert_success
  assert_output true

  run l.is_number.s 9999
  assert_success
  assert_output true
}

@test "l.is_number.s, negative integers" {
  run l.is_number.s -0
  assert_success
  assert_output true

  run l.is_number.s -1
  assert_success
  assert_output true

  run l.is_number.s -10
  assert_success
  assert_output true

  run l.is_number.s -9999
  assert_success
  assert_output true
}

@test "l.is_number.s, floats" {
  run l.is_number.s 0.0
  assert_success
  assert_output true

  run l.is_number.s 0.1
  assert_success
  assert_output true

  run l.is_number.s 0.10
  assert_success
  assert_output true

  run l.is_number.s 10.0
  assert_success
  assert_output true

  run l.is_number.s 99.99
  assert_success
  assert_output true
}

@test "l.is_number.s, negative floats" {
  run l.is_number.s -0.0
  assert_success
  assert_output true

  run l.is_number.s -0.1
  assert_success
  assert_output true

  run l.is_number.s -0.10
  assert_success
  assert_output true

  run l.is_number.s -10.0
  assert_success
  assert_output true

  run l.is_number.s -99.99
  assert_success
  assert_output true
}

@test "l.is_number.s, a-zA-Z" {
  run l.is_number.s a
  assert_success
  assert_output false

  run l.is_number.s z
  assert_success
  assert_output false

  run l.is_number.s A
  assert_success
  assert_output false

  run l.is_number.s Z
  assert_success
  assert_output false
}

@test "l.is_number.s, symbols" {
  run l.is_number.s -
  assert_success
  assert_output false
}
