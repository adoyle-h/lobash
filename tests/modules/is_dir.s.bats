#!/usr/bin/env bats

setup_fixture

@test "l.is_dir.s a file" {
  local temp=$(mktemp)
  run l.is_dir.s "$temp"
  assert_success
  assert_output 'false'
}

@test "l.is_dir.s a directory" {
  local temp=$(mktemp -d)
  run l.is_dir.s "$temp"
  assert_success
  assert_output 'true'
}

@test "l.is_dir.s unexist path" {
  run l.is_dir.s /not-exist
  assert_success
  assert_output 'false'
}
