#!/usr/bin/env bats

setup_fixture

_setup_file() {
  skip 'Why it hangs in bats?'
}

@test "l.cursor_pos pos" {
  local pos=()
  l.cursor_pos pos
  assert_equal "$?" 0
  assert_equal "${#pos[@]}" 2
  assert_regex "${pos[0]}" '[0-9]+'
  assert_regex "${pos[1]}" '[0-9]+'
}

@test "l.cursor_pos" {
  run l.cursor_pos
  assert_success
  assert_lines_size 2
  assert_regex "${lines[0]}" '[0-9]+'
  assert_regex "${lines[1]}" '[0-9]+'
}
