#!/usr/bin/env bats

setup_fixture

@test "l.is_bash.s" {
  run l.is_bash.s
  assert_success
  assert_output 'true'
}
