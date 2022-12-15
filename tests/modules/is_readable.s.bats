#!/usr/bin/env bats

setup_fixture

@test "l.is_readable.s a normal file" {
  local temp="$BATS_TEST_TMPDIR/normal"
  touch "$temp"
  run l.is_readable.s "$temp"
  assert_success
  assert_output true
}

@test "l.is_readable.s a executable file" {
  local temp="$BATS_TEST_TMPDIR/executable"
  touch "$temp"
  chmod +x "$temp"
  run l.is_readable.s "$temp"
  assert_success
  assert_output true
}

@test "l.is_readable.s a directory" {
  local temp=$BATS_TEST_TMPDIR
  run l.is_readable.s "$temp"
  assert_success
  # interesting https://superuser.com/a/168583
  assert_output true
}

@test "l.is_readable.s unexist path" {
  run l.is_readable.s /not-exist
  assert_success
  assert_output false
}
