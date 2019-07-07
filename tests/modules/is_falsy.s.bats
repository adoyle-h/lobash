#!/usr/bin/env bats

setup_fixture
test_prepare is_falsy.s
load_module is_falsy.s

@test "l.is_falsy.s true" {
  run l.is_falsy.s true
	assert_success
	assert_output false
}

@test "l.is_falsy.s 0" {
  run l.is_falsy.s 0
	assert_success
	assert_output false
}

@test "l.is_falsy.s false" {
  run l.is_falsy.s false
	assert_success
	assert_output true
}

@test "l.is_falsy.s 2" {
  run l.is_falsy.s 2
	assert_success
	assert_output true
}

@test "l.is_falsy.s 0.123" {
  run l.is_falsy.s 0.123
	assert_success
	assert_output false
}
