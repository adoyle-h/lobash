#!/usr/bin/env bats

setup_fixture

@test "l.is_file a file" {
  local temp="$BATS_TEST_TMPDIR/normal"
  touch "$temp"
  run l.is_file "$temp"
  assert_success
  assert_output ''
}

@test "l.is_file a directory" {
  local temp=$BATS_TEST_TMPDIR
  run l.is_file "$temp"
  assert_failure
  assert_output ''
}

@test "l.is_file unexist path" {
  run l.is_file /not-exist
  assert_failure
  assert_output ''
}
