#!/usr/bin/env bats

setup_fixture
test_prepare not
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
  assert_failure 3
  assert_output "Invalid condition! It must be one of 'true' and 'false'. Current value="
}

@test "l.not" {
  run l.not
  assert_failure 3
  assert_output "Invalid condition! It must be one of 'true' and 'false'. Current value="
}

@test "l.not xxx" {
  run l.not xxx
  assert_failure 3
  assert_output "Invalid condition! It must be one of 'true' and 'false'. Current value=xxx"
}
