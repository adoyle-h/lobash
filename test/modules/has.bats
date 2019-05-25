#!/usr/bin/env bats

setup_fixture
load_module has

@test "has command" {
  run has command bash
  assert_success

  run has command aaaaa
  assert_failure
}

@test "has not command" {
  run has not command aaaa
  assert_success

  run has not command bash
  assert_failure
}
