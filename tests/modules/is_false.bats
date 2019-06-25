#!/usr/bin/env bats

setup_fixture
load_module is_false

@test "l.is_false true" {
  run l.is_false true
	assert_success
	assert_output false
}

@test "l.is_false 0" {
  run l.is_false 0
	assert_success
	assert_output false
}

@test "l.is_false false" {
  run l.is_false false
	assert_success
	assert_output true
}

@test "l.is_false 2" {
  run l.is_false 2
	assert_success
	assert_output true
}

@test "l.is_false 0.123" {
  run l.is_false 0.123
	assert_success
	assert_output false
}

