#!/usr/bin/env bats

setup_fixture

@test "l.is_array.s array" {
  local -a y=(a h)
  run l.is_array.s y
  assert_success
  assert_output true
}

@test "l.is_array.s associate array" {
  local -A A=([a]=1)
  run l.is_array.s A
  assert_success
  assert_output true
}

@test "l.is_array.s uninitialized array" {
  if [[ $BASH_VERSION =~ ^'4.3' ]]; then skip; fi

  local -a a
  run l.is_array.s a
  assert_success
  assert_output true

  local -a A
  run l.is_array.s A
  assert_success
  assert_output true
}

@test "l.is_array.s number" {
  local -i y=1
  run l.is_array.s y
  assert_success
  assert_output false
}

@test "l.is_array.s string" {
  local y=string
  run l.is_array.s y
  assert_success
  assert_output false
}

@test "l.is_array.s ''" {
  run l.is_array.s ''
  assert_success
  assert_output false
}

@test "l.is_array.s" {
  run l.is_array.s
  assert_success
  assert_output false
}

@test "l.is_array.s undefined variable" {
  run l.is_array.s k
  assert_success
  assert_output false
}
