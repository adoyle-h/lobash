#!/usr/bin/env bats

setup_fixture
test_prepare is_exported
load_module is_exported

@test "l.is_exported <exported variable> -> true" {
  export a=1
  run l.is_exported a
  assert_success
  assert_output ''
}

@test "l.is_exported <unexported variable>-> false" {
  b=1
  run l.is_exported b
  assert_failure
  assert_output ''
}

@test "l.is_exported <undefined variable> -> false" {
  run l.is_exported c
  assert_failure
  assert_output ''
}

@test "l.is_exported <readonly variable> -> false" {
  d=1
  readonly
  run l.is_exported d
  assert_failure
  assert_output ''
}

@test "l.is_exported <array variable> -> false" {
  declare -a e=(1)
  run l.is_exported e
  assert_failure
  assert_output ''
}

@test "l.is_exported <associate array variable> -> false" {
  declare -A f=([foo]=1)
  run l.is_exported f
  assert_failure
  assert_output ''
}
