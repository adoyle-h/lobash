#!/usr/bin/env bats

setup_fixture
load_module detect_os

@test "detect_os" {
  skip "how to test it?"
  run detect_os
	assert_success
	assert_output MacOS
}
