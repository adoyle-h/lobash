#!/usr/bin/env bats

setup_fixture

@test "l.is_integer, integers" {
  run l.is_integer 0
  assert_success
  assert_output ''

  run l.is_integer 1
  assert_success
  assert_output ''

  run l.is_integer 10
  assert_success
  assert_output ''

  run l.is_integer 9999
  assert_success
  assert_output ''
}

@test "l.is_integer, negative integers" {
  run l.is_integer -0
  assert_success
  assert_output ''

  run l.is_integer -1
  assert_success
  assert_output ''

  run l.is_integer -10
  assert_success
  assert_output ''

  run l.is_integer -9999
  assert_success
  assert_output ''
}

@test "l.is_integer, floats" {
  run l.is_integer 0.0
  assert_failure
  assert_output ''

  run l.is_integer 0.1
  assert_failure
  assert_output ''

  run l.is_integer 0.10
  assert_failure
  assert_output ''

  run l.is_integer 10.0
  assert_failure
  assert_output ''

  run l.is_integer 99.99
  assert_failure
  assert_output ''
}

@test "l.is_integer, negative floats" {
  run l.is_integer -0.0
  assert_failure
  assert_output ''

  run l.is_integer -0.1
  assert_failure
  assert_output ''

  run l.is_integer -0.10
  assert_failure
  assert_output ''

  run l.is_integer -10.0
  assert_failure
  assert_output ''

  run l.is_integer -99.99
  assert_failure
  assert_output ''
}

@test "l.is_integer, a-zA-Z" {
  run l.is_integer a
  assert_failure
  assert_output ''

  run l.is_integer z
  assert_failure
  assert_output ''

  run l.is_integer A
  assert_failure
  assert_output ''

  run l.is_integer Z
  assert_failure
  assert_output ''
}

@test "l.is_integer, symbols" {
  run l.is_integer -
  assert_failure
  assert_output ''
}
