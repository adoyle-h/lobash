#!/usr/bin/env bats

setup_fixture

@test "l.is_empty_dir ''" {
  run l.is_empty_dir
  assert_failure
  assert_output ''

  run l.is_empty_dir ''
  assert_failure
  assert_output ''
}

@test "l.is_empty_dir /whattttt" {
  run l.is_empty_dir /whattttt
  assert_failure
  assert_output ''
}

@test "l.is_empty_dir /" {
  run l.is_empty_dir /
  assert_failure
  assert_output ''
}

@test "l.is_empty_dir temp_dir" {
  local temp_dir
  temp_dir=$(mktemp -d)
  run l.is_empty_dir "$temp_dir"
  assert_success
  assert_output ''
}
