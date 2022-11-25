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

@test "l.is_exported <readonly variable>" {
  d=1
  readonly
  run l.is_exported d
  assert_failure
  assert_output ''

  export d
  run l.is_exported d
  assert_success
  assert_output ''
}

@test "l.is_exported <array>" {
  declare -a e=(1)
  run l.is_exported e
  assert_failure
  assert_output ''

  export e
  run l.is_exported e
  assert_success
  assert_output ''
}

@test "l.is_exported <associate array>" {
  declare -A f=([foo]=1)
  run l.is_exported f
  assert_failure
  assert_output ''

  export f
  run l.is_exported f
  assert_success
  assert_output ''
}

@test "l.is_exported <export-but-uninitialized> -> false" {
  if [[ $BASH_VERSION =~ ^'4.3' ]]; then skip; fi # Skip testing uninitialized variable for bash 4.3

  export g
  run l.is_exported g
  assert_success
  assert_output ''
}

@test "l.is_exported <function> -> false" {
  fff() { echo 1; }
  run l.is_exported fff
  assert_failure
  assert_output ''
}

@test "l.is_exported <local-associate-array-name-has-x> -> false" {
  local -A xxx=()
  run l.is_exported xxx
  assert_failure
  assert_output ''
}
