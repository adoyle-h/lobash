#!/usr/bin/env bats

setup_fixture
test_prepare is_ubuntu
load_module is_ubuntu

@test "l.is_ubuntu" {
  skip "how to test it?"
  run l.is_ubuntu
	assert_failure
	assert_output ''
}
