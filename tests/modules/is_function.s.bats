#!/usr/bin/env bats
# shellcheck disable=2034

setup_fixture

@test "l.is_function.s a function" {
  function abc() { echo 123; }
  run l.is_function.s abc
  assert_success
  assert_output true
}

@test "l.is_function.s an alias" {
  function abc() { echo 123; }
  alias k=abc
  run l.is_function.s k
  assert_success
  assert_output false
}

@test "l.is_function.s undefined var" {
  run l.is_function.s undefined
  assert_success
  assert_output false
}

@test "l.is_function.s string" {
  local s='abc'
  run l.is_function.s s
  assert_success
  assert_output false
}

@test "l.is_function.s empty string" {
  local s=''
  run l.is_function.s s
  assert_success
  assert_output false

  run l.is_function.s ""
  assert_success
  assert_output false
}

@test "l.is_function.s array" {
  declare -a a=()
  run l.is_function.s a
  assert_success
  assert_output false

  declare -A A=()
  run l.is_function.s A
  assert_success
  assert_output false
}

@test "l.is_function.s number" {
  run l.is_function.s 123
  assert_success
  assert_output false

  run l.is_function.s 0
  assert_success
  assert_output false

  local n=123
  run l.is_function.s n
  assert_success
  assert_output false
}
