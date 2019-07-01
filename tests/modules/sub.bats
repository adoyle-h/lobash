#!/usr/bin/env bats

setup_fixture
load_module sub

@test "l.sub 2 without any print" {
  local y=2
  run l.sub y
  assert_success
  assert_output ''
}

@test "l.sub 0" {
  local y=0
  l.sub y
  assert_equal "$y" -1
}

@test "l.sub 4" {
  local y=4
  local r
  l.sub y
  assert_equal "$y" 3
  l.sub y
  assert_equal "$y" 2
}

@test "l.sub 4 1" {
  local y=4
  local r
  l.sub y 1
  assert_equal "$y" 3
  l.sub y 1
  assert_equal "$y" 2
}

@test "l.sub 6 2" {
  local y=6
  local r
  l.sub y 2
  assert_equal "$y" 4
  l.sub y 2
  assert_equal "$y" 2
}

@test "l.sub 1 -2" {
  local y=1
  local r
  l.sub y -2
  assert_equal "$y" 3
  l.sub y -2
  assert_equal "$y" 5
}

@test "l.sub 1 1" {
  local y=1
  local r
  l.sub y 1
  assert_equal "$y" 0
  l.sub y 1
  assert_equal "$y" '-1'
}

@test "l.sub 1 3" {
  local y=1
  local r
  l.sub y 3
  assert_equal "$y" '-2'
  l.sub y 3
  assert_equal "$y" '-5'
}
