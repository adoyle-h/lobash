#!/usr/bin/env bats

setup_fixture

@test "l.str_size ''" {
  run l.str_size ''
  assert_success
  assert_output 0
}

@test "l.str_size hello" {
  run l.str_size "hello"
  assert_success
  assert_output 5
}

@test "l.str_size ' hello '" {
  run l.str_size " hello "
  assert_success
  assert_output 7
}

@test "l.str_size with French" {
  run l.str_size 'Généralités'
  assert_success
  assert_output 11
}

@test "l.str_size with Chinese" {
  run l.str_size '中文'
  assert_success
  assert_output 2
}
