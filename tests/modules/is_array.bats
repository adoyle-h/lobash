#!/usr/bin/env bats

setup_fixture
test_prepare is_array
load_module is_array

@test "l.is_array array" {
  local -a y=(a h)
  run l.is_array y
  assert_success
  assert_output ''
}

@test "l.is_array associate array" {
  local -A A=([a]=1)
  run l.is_array A
  assert_success
  assert_output ''
}

@test "l.is_array uninitialized array" {
  if [[ $BASH_VERSION =~ ^'4.3' ]]; then skip; fi

  local -a a
  run l.is_array a
  assert_success
  assert_output ''

  local -A A
  run l.is_array A
  assert_success
  assert_output ''
}

@test "l.is_array number" {
  local -i y=1
  run l.is_array y
  assert_failure
  assert_output ''
}

@test "l.is_array string" {
  local y=string
  run l.is_array y
  assert_failure
  assert_output ''
}

@test "l.is_array ''" {
  run l.is_array ''
  assert_failure
  assert_output ''
}

@test "l.is_array" {
  run l.is_array
  assert_failure
  assert_output ''
}

@test "l.is_array undefined variable" {
  run l.is_array k
  assert_failure
  assert_output ''
}
