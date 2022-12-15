#!/usr/bin/env bats

setup_fixture

@test "l.is_readable a normal file" {
  local temp="$BATS_TEST_TMPDIR/normal"
  : > "$temp"
  run l.is_readable "$temp"
  assert_success
  assert_output ''
}

@test "l.is_readable a executable file" {
  local temp="$BATS_TEST_TMPDIR/executable"
  : > "$temp"
  chmod +x "$temp"
  run l.is_readable "$temp"
  assert_success
  assert_output ''
}

@test "l.is_readable a directory" {
  local temp=$BATS_TEST_TMPDIR
  run l.is_readable "$temp"
  assert_success
  # interesting https://superuser.com/a/168583
  assert_output ''
}

@test "l.is_readable unexist path" {
  run l.is_readable /not-exist
  assert_failure
  assert_output ''
}
