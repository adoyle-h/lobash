#!/usr/bin/env bats

setup_fixture

@test "l.echo_array (a b c)" {
  local arr=(a b c)
  run l.echo_array arr
  assert_success
  assert_equal "${#lines[@]}" 3
  assert_line -n 0 a
  assert_line -n 1 b
  assert_line -n 2 c
}

@test "l.echo_array (a 'b c')" {
  local arr=(a 'b c')
  run l.echo_array arr
  assert_success
  assert_equal "${#lines[@]}" 2
  assert_line -n 0 a
  assert_line -n 1 'b c'
}

@test "l.echo_array ()" {
  local arr=()
  run l.echo_array arr
  assert_success
  assert_equal "${#lines[@]}" 0
}
