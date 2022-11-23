#!/usr/bin/env bats

setup_fixture
test_prepare is_file.s
load_module is_file.s

@test "l.is_file.s a file" {
  local temp=$(mktemp)
  run l.is_file.s "$temp"
  assert_success
  assert_output true
}

@test "l.is_file.s a directory" {
  local temp=$(mktemp -d)
  run l.is_file.s "$temp"
  assert_success
  assert_output false
}

@test "l.is_file.s unexist path" {
  run l.is_file.s /not-exist
  assert_success
  assert_output false
}
