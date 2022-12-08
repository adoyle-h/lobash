#!/usr/bin/env bats

setup_fixture

@test "l.str_len ''" {
  run l.str_len ''
  assert_success
  assert_output 0
}

@test "l.str_len hello" {
  run l.str_len "hello"
  assert_success
  assert_output 5
}

@test "l.str_len ' hello '" {
  run l.str_len " hello "
  assert_success
  assert_output 7
}

@test "l.str_len 'Généralités'" {
  run l.str_len 'Généralités'
  assert_success
  assert_output 14
}

@test "l.str_len '中文'" {
  run l.str_len '中文'
  assert_success
  assert_output 6
}
