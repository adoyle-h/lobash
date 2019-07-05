#!/usr/bin/env bats

setup_fixture
test_prepare inc
load_module inc

@test "l.inc 1 without any print" {
  local y=1
  run l.inc y
  assert_success
  assert_output ''
}

@test "l.inc 2" {
  local y=2
  local r
  l.inc y
  assert_equal "$y" 3
  l.inc y
  assert_equal "$y" 4
}

@test "l.inc 1 1" {
  local y=1
  local r
  l.inc y 1
  assert_equal "$y" 2
  l.inc y 1
  assert_equal "$y" 3
}

@test "l.inc 1 2" {
  local y=1
  local r
  l.inc y 2
  assert_equal "$y" 3
  l.inc y 2
  assert_equal "$y" 5
}

@test "l.inc 10 -2" {
  local y=10
  local r
  l.inc y -2
  assert_equal "$y" 8
  l.inc y -2
  assert_equal "$y" 6
}

@test "l.inc 1 -1" {
  local y=1
  local r
  l.inc y -1
  assert_equal "$y" 0
  l.inc y -1
  assert_equal "$y" '-1'
}
