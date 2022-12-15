#!/usr/bin/env bats

setup_fixture

@test "l.is_dir a file" {
  local temp="$BATS_TEST_TMPDIR/normal"
  : > "$temp"
  run l.is_dir "$temp"
  assert_failure
  assert_output ''
}

@test "l.is_dir a directory" {
  local temp="$BATS_TEST_TMPDIR"
  run l.is_dir "$temp"
  assert_success
  assert_output ''
}

@test "l.is_dir unexist path" {
  run l.is_dir /not-exist
  assert_failure
  assert_output ''
}
