#!/usr/bin/env bats

setup_fixture
test_prepare is_bash
load_module is_bash

@test "l.is_bash" {
  run l.is_bash
  assert_success
  assert_output ''
}
