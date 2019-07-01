#!/usr/bin/env bats

setup_fixture
load_module is_file

@test "l.is_file a file" {
  local temp=$(mktemp)
  run l.is_file "$temp"
	assert_success
	assert_output true
}

@test "l.is_file a directory" {
  local temp=$(mktemp -d)
  run l.is_file "$temp"
	assert_success
	assert_output false
}

@test "l.is_file unexist path" {
  run l.is_file /not-exist
	assert_success
	assert_output false
}
