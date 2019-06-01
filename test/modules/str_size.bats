#!/usr/bin/env bats

setup_fixture
load_module str_size

@test "l.str_size hello" {
  run l.str_size "hello"
	assert_success
	assert_output 5
}

@test "l.str_size ' hello '" {
  run l.str_size " hello "
	assert_success
	assert_output 7
}
