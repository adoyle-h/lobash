#!/usr/bin/env bats

setup_fixture
test_prepare is_falsy
load_module is_falsy

@test "l.is_falsy true" {
  run l.is_falsy true
	assert_failure
	assert_output ''
}

@test "l.is_falsy 0" {
  run l.is_falsy 0
	assert_failure
	assert_output ''
}

@test "l.is_falsy false" {
  run l.is_falsy false
	assert_success
	assert_output ''
}

@test "l.is_falsy 2" {
  run l.is_falsy 2
	assert_success
	assert_output ''
}

@test "l.is_falsy 0.123" {
  run l.is_falsy 0.123
	assert_failure
	assert_output ''
}
