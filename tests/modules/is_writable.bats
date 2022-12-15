#!/usr/bin/env bats

setup_fixture

@test "l.is_writable a normal file" {
  local temp="$BATS_TEST_TMPDIR/normal"
  touch "$temp"
  run l.is_writable "$temp"
  assert_success
  assert_output ''
}

@test "l.is_writable a executable file" {
  local temp="$BATS_TEST_TMPDIR/executable"
  touch "$temp"
  chmod +x "$temp"
  run l.is_writable "$temp"
  assert_success
  assert_output ''
}

@test "l.is_writable a directory" {
  local temp=$BATS_TEST_TMPDIR
  run l.is_writable "$temp"
  assert_success
  # interesting https://superuser.com/a/168583
  assert_output ''
}

@test "l.is_writable unexist path" {
  run l.is_writable /not-exist
  assert_failure
  assert_output ''
}
