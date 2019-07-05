#!/usr/bin/env bats

setup_fixture
test_prepare sort
load_module sort

@test "l.sort (B a C d E b 8 1 2 4)" {
  local arr=(B a C d E b 8 1 2 4)
  run l.sort arr
  assert_success
  assert_equal "${#lines[@]}" 10
  assert_line -n 0 1
  assert_line -n 1 2
  assert_line -n 2 4
  assert_line -n 3 8
  assert_line -n 4 B
  assert_line -n 5 C
  assert_line -n 6 E
  assert_line -n 7 a
  assert_line -n 8 b
  assert_line -n 9 d
}

@test "l.sort ()" {
  local arr=()
  run l.sort arr
  assert_success
  assert_equal "${#lines[@]}" 0
}

@test "l.sort ('b a' a c)" {
  local arr=('b a' a c)
  run l.sort arr
  assert_success
  assert_equal "${#lines[@]}" 3
  assert_line -n 0 a
  assert_line -n 1 'b a'
  assert_line -n 2 c
}
