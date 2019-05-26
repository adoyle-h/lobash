#!/usr/bin/env bats

setup_fixture
load_module str_size

@test "str_size hello" {
  run str_size "hello"
	assert_success
	assert_output 5
}

@test "str_size ' hello '" {
  run str_size " hello "
	assert_success
	assert_output 7
}
