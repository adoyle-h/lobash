#!/usr/bin/env bats

setup_fixture

@test "l.first (a asd bcd d)" {
  local arr=(a asd bcd d)
  run l.first arr
  assert_success
  assert_output 'a'
}

@test "l.first ('a asd' bcd d)" {
  local arr=('a asd' bcd d)
  run l.first arr
  assert_success
  assert_output 'a asd'
}

@test "l.first ()" {
  local arr=()
  run l.first arr
  assert_success
  assert_output ''
}
