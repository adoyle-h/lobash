#!/usr/bin/env bats

setup_fixture
test_prepare repeat
load_module repeat

@test "l.repeat -1 echo 0" {
  run l.repeat -1 echo 0
  assert_success
  assert_equal ${#lines[@]} 0
}

@test "l.repeat 0 echo 0" {
  run l.repeat 0 echo 0
  assert_success
  assert_equal ${#lines[@]} 0
}

@test "l.repeat 1 echo 1" {
  run l.repeat 1 echo 1
  assert_success
  assert_equal ${#lines[@]} 1
  assert_line -n 0 1
}

@test "l.repeat 2 echo 2" {
  run l.repeat 2 echo 2
  assert_success
  assert_equal ${#lines[@]} 2
  assert_line -n 0 2
  assert_line -n 1 2
}

@test "l.repeat 6 echo 6" {
  run l.repeat 6 echo 6
  assert_success
  assert_equal ${#lines[@]} 6
  assert_line -n 0 6
  assert_line -n 1 6
  assert_line -n 2 6
  assert_line -n 3 6
  assert_line -n 4 6
  assert_line -n 5 6
}
