#!/usr/bin/env bats

setup_fixture

@test "l.is_float.s, integers" {
  run l.is_float.s 0
  assert_success
  assert_output true

  run l.is_float.s 1
  assert_success
  assert_output true

  run l.is_float.s 10
  assert_success
  assert_output true

  run l.is_float.s 9999
  assert_success
  assert_output true
}

@test "l.is_float.s, negative integers" {
  run l.is_float.s -0
  assert_success
  assert_output true

  run l.is_float.s -1
  assert_success
  assert_output true

  run l.is_float.s -10
  assert_success
  assert_output true

  run l.is_float.s -9999
  assert_success
  assert_output true
}

@test "l.is_float.s, floats" {
  run l.is_float.s 0.0
  assert_success
  assert_output true

  run l.is_float.s 0.1
  assert_success
  assert_output true

  run l.is_float.s 0.10
  assert_success
  assert_output true

  run l.is_float.s 10.0
  assert_success
  assert_output true

  run l.is_float.s 99.99
  assert_success
  assert_output true
}

@test "l.is_float.s, negative floats" {
  run l.is_float.s -0.0
  assert_success
  assert_output true

  run l.is_float.s -0.1
  assert_success
  assert_output true

  run l.is_float.s -0.10
  assert_success
  assert_output true

  run l.is_float.s -10.0
  assert_success
  assert_output true

  run l.is_float.s -99.99
  assert_success
  assert_output true
}

@test "l.is_float.s, a-zA-Z" {
  run l.is_float.s a
  assert_success
  assert_output false

  run l.is_float.s z
  assert_success
  assert_output false

  run l.is_float.s A
  assert_success
  assert_output false

  run l.is_float.s Z
  assert_success
  assert_output false
}


@test "l.is_float.s, symbols" {
  run l.is_float.s -
  assert_success
  assert_output false
}
