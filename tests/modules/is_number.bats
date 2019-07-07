#!/usr/bin/env bats

setup_fixture
test_prepare is_number
load_module is_number

@test "l.is_number, integers" {
  run l.is_number 0
  assert_success
  assert_output ''

  run l.is_number 1
  assert_success
  assert_output ''

  run l.is_number 10
  assert_success
  assert_output ''

  run l.is_number 9999
  assert_success
  assert_output ''
}

@test "l.is_number, negative integers" {
  run l.is_number -0
  assert_success
  assert_output ''

  run l.is_number -1
  assert_success
  assert_output ''

  run l.is_number -10
  assert_success
  assert_output ''

  run l.is_number -9999
  assert_success
  assert_output ''
}

@test "l.is_number, floats" {
  run l.is_number 0.0
  assert_success
  assert_output ''

  run l.is_number 0.1
  assert_success
  assert_output ''

  run l.is_number 0.10
  assert_success
  assert_output ''

  run l.is_number 10.0
  assert_success
  assert_output ''

  run l.is_number 99.99
  assert_success
  assert_output ''
}

@test "l.is_number, negative floats" {
  run l.is_number -0.0
  assert_success
  assert_output ''

  run l.is_number -0.1
  assert_success
  assert_output ''

  run l.is_number -0.10
  assert_success
  assert_output ''

  run l.is_number -10.0
  assert_success
  assert_output ''

  run l.is_number -99.99
  assert_success
  assert_output ''
}

@test "l.is_number, a-zA-Z" {
  run l.is_number a
  assert_failure
  assert_output ''

  run l.is_number z
  assert_failure
  assert_output ''

  run l.is_number A
  assert_failure
  assert_output ''

  run l.is_number Z
  assert_failure
  assert_output ''
}

@test "l.is_number, symbols" {
  run l.is_number -
  assert_failure
  assert_output ''
}
