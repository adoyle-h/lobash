#!/usr/bin/env bats

setup_fixture

_setup_file() {
  if [[ -n ${CI:-} ]]; then
    skip 'CI has not terminal window'
  fi
}

@test "l.term_size" {
  run l.term_size
  assert_equal "$?" 0
  assert_equal "${#lines[@]}" 2
  assert_regex "${lines[0]}" '[0-9]+'
  assert_regex "${lines[1]}" '[0-9]+'
}
