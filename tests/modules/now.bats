#!/usr/bin/env bats

setup_fixture
test_prepare now
load_module now

@test "l.now, the length of result should be 13" {
  run l.now
  assert_equal "${#output}" 13
  assert_output -e '^[0-9]+$'
}
