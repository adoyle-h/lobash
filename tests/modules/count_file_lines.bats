#!/usr/bin/env bats

setup_fixture

@test "l.count_file_lines" {
  local lines=10
  local temp_file

  temp_file="$(mktemp)"
  for i in seq 1 $lines; do
    printf '%s\n' "$i" >> "$temp_file"
  done

  run l.count_file_lines "$temp_file"
  assert_success
  assert_output "$lines"
}
