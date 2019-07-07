#!/usr/bin/env bats

setup_fixture
test_prepare is_file
load_module is_file

@test "l.is_file a file" {
  local temp=$(mktemp)
  run l.is_file "$temp"
	assert_success
	assert_output ''
}

@test "l.is_file a directory" {
  local temp=$(mktemp -d)
  run l.is_file "$temp"
	assert_failure
	assert_output ''
}

@test "l.is_file unexist path" {
  run l.is_file /not-exist
	assert_failure
	assert_output ''
}
