#!/usr/bin/env bats

setup_fixture

@test "l.is_float, integers" {
  run l.is_float 0
  assert_success
  assert_output ''

  run l.is_float 1
  assert_success
  assert_output ''

  run l.is_float 10
  assert_success
  assert_output ''

  run l.is_float 9999
  assert_success
  assert_output ''
}

@test "l.is_float, negative integers" {
  run l.is_float -0
  assert_success
  assert_output ''

  run l.is_float -1
  assert_success
  assert_output ''

  run l.is_float -10
  assert_success
  assert_output ''

  run l.is_float -9999
  assert_success
  assert_output ''
}

@test "l.is_float, floats" {
  run l.is_float 0.0
  assert_success
  assert_output ''

  run l.is_float 0.1
  assert_success
  assert_output ''

  run l.is_float 0.10
  assert_success
  assert_output ''

  run l.is_float 10.0
  assert_success
  assert_output ''

  run l.is_float 99.99
  assert_success
  assert_output ''
}

@test "l.is_float, negative floats" {
  run l.is_float -0.0
  assert_success
  assert_output ''

  run l.is_float -0.1
  assert_success
  assert_output ''

  run l.is_float -0.10
  assert_success
  assert_output ''

  run l.is_float -10.0
  assert_success
  assert_output ''

  run l.is_float -99.99
  assert_success
  assert_output ''
}

@test "l.is_float, a-zA-Z" {
  run l.is_float a
  assert_failure
  assert_output ''

  run l.is_float z
  assert_failure
  assert_output ''

  run l.is_float A
  assert_failure
  assert_output ''

  run l.is_float Z
  assert_failure
  assert_output ''
}

@test "l.is_float, symbols" {
  run l.is_float -
  assert_failure
  assert_output ''
}
