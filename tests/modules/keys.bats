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
  local -A array=([a]=1 [b]=2 [c]=3)
  run l.keys array
  assert_success
  assert_equal "${#lines[@]}" 3
  assert_line -n 0 'c'
  assert_line -n 1 'b'
  assert_line -n 2 'a'
}
