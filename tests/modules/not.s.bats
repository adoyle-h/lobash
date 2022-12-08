#!/usr/bin/env bats

setup_fixture

@test "l.not.s true" {
  run l.not.s true
  assert_success
  assert_output false
}

@test "l.not.s false" {
  run l.not.s false
  assert_success
  assert_output true
}

@test "l.not.s ''" {
  run l.not.s
  assert_failure 3
  assert_output "Invalid condition! It must be one of 'true' and 'false'. Current value="
}

@test "l.not.s" {
  run l.not.s
  assert_failure 3
  assert_output "Invalid condition! It must be one of 'true' and 'false'. Current value="
}

@test "l.not.s xxx" {
  run l.not.s xxx
  assert_failure 3
  assert_output "Invalid condition! It must be one of 'true' and 'false'. Current value=xxx"
}
