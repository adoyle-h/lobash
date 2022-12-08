#!/usr/bin/env bats

setup_fixture

@test "l.is_undefined <exported variable> -> false" {
  export a=1
  run l.is_undefined a
  assert_failure
  assert_output ''
}

@test "l.is_undefined <unexported variable>-> false" {
  b=1
  run l.is_undefined b
  assert_failure
  assert_output ''
}

@test "l.is_undefined <undefined variable> -> true" {
  run l.is_undefined c
  assert_success
  assert_output ''
}

@test "l.is_undefined <readonly variable> -> false" {
  d=1
  readonly
  run l.is_undefined d
  assert_failure
  assert_output ''
}

@test "l.is_undefined <array variable> -> false" {
  declare -a e=(1)
  run l.is_undefined e
  assert_failure
  assert_output ''
}

@test "l.is_undefined <associate array variable> -> false" {
  declare -A f=([foo]=1)
  run l.is_undefined f
  assert_failure
  assert_output ''
}
