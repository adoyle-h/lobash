#!/usr/bin/env bats

setup_fixture
load_module not

@test "l.not true" {
  run l.not true
  assert_success
  assert_output false
}

@test "l.not false" {
  run l.not false
  assert_success
  assert_output true
}

@test "l.not ''" {
  run l.not
  assert_failure 2
}

@test "l.not" {
  run l.not
  assert_failure 2
}

@test "l.not xxx" {
  run l.not xxx
  assert_failure 2
}
