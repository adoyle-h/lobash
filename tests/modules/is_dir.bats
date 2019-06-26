#!/usr/bin/env bats

setup_fixture
load_module is_dir

@test "l.is_dir a file" {
  local temp=$(mktemp)
  run l.is_dir "$temp"
	assert_success
	assert_output false
}

@test "l.is_dir a directory" {
  local temp=$(mktemp -d)
  run l.is_dir "$temp"
	assert_success
	assert_output true
}

@test "l.is_dir unexist path" {
  run l.is_dir /not-exist
	assert_success
	assert_output false
}