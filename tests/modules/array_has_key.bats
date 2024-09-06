#!/usr/bin/env bats

setup_fixture

@test "l.array_has_key array to check number" {
  local arr=(he ll o)

  run l.array_has_key arr 0
  assert_success

  run l.array_has_key arr 1
  assert_success

  run l.array_has_key arr 2
  assert_success

  run l.array_has_key arr 3
  assert_failure
}

@test "l.array_has_key array to check char" {
  local arr=(he ll o)

  run l.array_has_key arr abc
  assert_failure

  run l.array_has_key arr he
  assert_failure
}

@test "l.array_has_key associative array" {
  # shellcheck disable=2034
  local -A a=([h]=1 [hello]=2)

  run l.array_has_key a h
  assert_success

  run l.array_has_key a hello
  assert_success

  run l.array_has_key a 0
  assert_failure

  run l.array_has_key a d
  assert_failure
}

@test "l.array_has_key empty string in array" {
  # shellcheck disable=2034
  local arr=('')

  run l.array_has_key arr 0
  assert_success
}

@test "l.array_has_key empty string in associative array" {
  # shellcheck disable=2034
  local -A a=([c]='')

  run l.array_has_key a c
  assert_success
}

@test "l.array_has_key array ''" {
  local arr=(he ll o)

  run l.array_has_key arr ''
  assert_failure

  # shellcheck disable=2034
  local -A arr2=([h]=1 [hello]=2)
  run l.array_has_key arr2 ''
  assert_failure
}

@test "l.array_has_key emptry array" {
  # shellcheck disable=2034
  local arr=()
  run l.array_has_key arr ''
  assert_failure

  run l.array_has_key arr 0
  assert_failure

  run l.array_has_key arr abc
  assert_failure
}

@test "l.array_has_key emptry associative array" {
  # shellcheck disable=2034
  local -A a=()
  run l.array_has_key a ''
  assert_failure

  run l.array_has_key a 0
  assert_failure

  run l.array_has_key a abc
  assert_failure
}
