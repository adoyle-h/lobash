#!/usr/bin/env bats

setup_fixture

@test "l.is_executable_file a normal file" {
  local temp="$BATS_TEST_TMPDIR/normal"
  : > "$temp"
  run l.is_executable_file "$temp"
  assert_failure
  assert_output ''
}

@test "l.is_executable_file a executable file" {
  local temp="$BATS_TEST_TMPDIR/executable"
  : > "$temp"
  chmod +x "$temp"
  run l.is_executable_file "$temp"
  assert_success
  assert_output ''
}

@test "l.is_executable_file a directory" {
  local temp=$BATS_TEST_TMPDIR
  run l.is_executable_file "$temp"
  assert_failure
  # interesting https://superuser.com/a/168583
  assert_output ''
}

@test "l.is_executable_file unexist path" {
  run l.is_executable_file /not-exist
  assert_failure
  assert_output ''
}
