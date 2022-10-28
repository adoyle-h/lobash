#!/usr/bin/env bats

setup_fixture
test_prepare keys
load_module keys

@test "l.keys <array>" {
  local array=(a b c)
  run l.keys array
  assert_success
  assert_equal "${#lines[@]}" 3
  assert_line -n 0 '0'
  assert_line -n 1 '1'
  assert_line -n 2 '2'
}

@test "l.keys <associative array>" {
  local -A array=([a]=1 [b]=2 [k]=5 [c]=3)
  run l.keys array
  assert_success
  assert_equal "${#lines[@]}" 4

  # in MacOS
  # assert_line -n 0 'k'
  # assert_line -n 1 'c'
  # assert_line -n 2 'b'
  # assert_line -n 3 'a'

  # in Linux
  # assert_line -n 0 'a'
  # assert_line -n 1 'b'
  # assert_line -n 2 'c'
  # assert_line -n 3 'k'
}
