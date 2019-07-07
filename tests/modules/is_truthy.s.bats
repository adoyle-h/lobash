#!/usr/bin/env bats

setup_fixture
test_prepare is_truthy.s
load_module is_truthy.s

@test "l.is_truthy.s true" {
  run l.is_truthy.s true
	assert_success
	assert_output true
}

@test "l.is_truthy.s 0" {
  run l.is_truthy.s 0
	assert_success
	assert_output true
}

@test "l.is_truthy.s false" {
  run l.is_truthy.s false
	assert_success
	assert_output false
}

@test "l.is_truthy.s 2" {
  run l.is_truthy.s 2
	assert_success
	assert_output false
}

@test "l.is_truthy.s 0.00" {
  run l.is_truthy.s 0.00
	assert_success
	assert_output false
}

