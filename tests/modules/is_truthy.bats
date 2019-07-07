#!/usr/bin/env bats

setup_fixture
test_prepare is_truthy
load_module is_truthy

@test "l.is_truthy true" {
  run l.is_truthy true
	assert_success
	assert_output ''
}

@test "l.is_truthy 0" {
  run l.is_truthy 0
	assert_success
	assert_output ''
}

@test "l.is_truthy false" {
  run l.is_truthy false
	assert_failure
	assert_output ''
}

@test "l.is_truthy 2" {
  run l.is_truthy 2
	assert_failure
	assert_output ''
}

@test "l.is_truthy 0.00" {
  run l.is_truthy 0.00
	assert_failure
	assert_output ''
}
