#!/usr/bin/env bats

setup_fixture
test_prepare now_s
load_module now_s

@test "l.now_s, the length of result should be 10" {
  run l.now_s
  assert_equal "${#output}" 10
  assert_output -e '^[0-9]+$'
}
