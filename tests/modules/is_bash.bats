#!/usr/bin/env bats

setup_fixture

@test "l.is_bash" {
  run l.is_bash
  assert_success
  assert_output ''
}
