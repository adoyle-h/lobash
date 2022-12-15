#!/usr/bin/env bats

setup_fixture

@test "l.count_file_lines" {
  local i
  local temp_file="$BATS_TEST_TMPDIR/normal"

  for i in {1..10}; do
    printf '%s\n' "$i" >> "$temp_file"
  done

  run l.count_file_lines "$temp_file"
  assert_success
  assert_output 10
}
