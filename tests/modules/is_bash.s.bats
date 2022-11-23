#!/usr/bin/env bats

setup_fixture
test_prepare is_bash.s
load_module is_bash.s

@test "l.is_bash.s" {
  run l.is_bash.s
  assert_success
  assert_output 'true'
}
