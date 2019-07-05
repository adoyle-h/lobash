#!/usr/bin/env bats

setup_fixture
test_prepare is_true
load_module is_true

@test "l.is_true true" {
  run l.is_true true
	assert_success
	assert_output true
}

@test "l.is_true 0" {
  run l.is_true 0
	assert_success
	assert_output true
}

@test "l.is_true false" {
  run l.is_true false
	assert_success
	assert_output false
}

@test "l.is_true 2" {
  run l.is_true 2
	assert_success
	assert_output false
}

@test "l.is_true 0.00" {
  run l.is_true 0.00
	assert_success
	assert_output false
}

