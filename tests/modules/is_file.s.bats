#!/usr/bin/env bats

setup_fixture

@test "l.is_file.s a file" {
  local temp="$BATS_TEST_TMPDIR/normal"
  touch "$temp"
  run l.is_file.s "$temp"
  assert_success
  assert_output true
}

@test "l.is_file.s a directory" {
  local temp=$BATS_TEST_TMPDIR
  run l.is_file.s "$temp"
  assert_success
  assert_output false
}

@test "l.is_file.s unexist path" {
  run l.is_file.s /not-exist
  assert_success
  assert_output false
}
