#!/usr/bin/env bats
# shellcheck disable=2034

setup_fixture

@test "l.is_function a function" {
  function abc() { echo 123; }
  run l.is_function abc
  assert_success
  assert_output ''
}

@test "l.is_function an alias" {
  function abc() { echo 123; }
  alias k=abc
  run l.is_function k
  assert_failure
  assert_output ''
}

@test "l.is_function undefined var" {
  run l.is_function undefined
  assert_failure
  assert_output ''
}

@test "l.is_function string" {
  local s='abc'
  run l.is_function s
  assert_failure
  assert_output ''
}

@test "l.is_function empty string" {
  local s=''
  run l.is_function s
  assert_failure
  assert_output ''

  run l.is_function ""
  assert_failure
  assert_output ''
}

@test "l.is_function array" {
  declare -a a=()
  run l.is_function a
  assert_failure
  assert_output ''

  declare -A A=()
  run l.is_function A
  assert_failure
  assert_output ''
}

@test "l.is_function number" {
  run l.is_function 123
  assert_failure
  assert_output ''

  run l.is_function 0
  assert_failure
  assert_output ''

  local n=123
  run l.is_function n
  assert_failure
  assert_output ''
}
