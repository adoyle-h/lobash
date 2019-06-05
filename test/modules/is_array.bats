#!/usr/bin/env bats

setup_fixture
load_module is_array

@test "l.is_array array" {
  local y=(a h)
  run l.is_array y
	assert_success
	assert_output true
}

@test "l.is_array string" {
  local y=string
  run l.is_array y
	assert_success
	assert_output false
}

@test "l.is_array empty" {
  run l.is_array ''
	assert_success
	assert_output false

  run l.is_array
	assert_success
	assert_output false
}

@test "l.is_array undefined variable" {
  run l.is_array k
	assert_success
	assert_output false
}
