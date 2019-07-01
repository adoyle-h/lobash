#!/usr/bin/env bats

setup_fixture
load_module is_integer

@test "l.is_integer, integers" {
  run l.is_integer 0
  assert_success
  assert_output true

  run l.is_integer 1
  assert_success
  assert_output true

  run l.is_integer 10
  assert_success
  assert_output true

  run l.is_integer 9999
  assert_success
  assert_output true
}

@test "l.is_integer, negative integers" {
  run l.is_integer -0
  assert_success
  assert_output true

  run l.is_integer -1
  assert_success
  assert_output true

  run l.is_integer -10
  assert_success
  assert_output true

  run l.is_integer -9999
  assert_success
  assert_output true
}

@test "l.is_integer, floats" {
  run l.is_integer 0.0
  assert_success
  assert_output false

  run l.is_integer 0.1
  assert_success
  assert_output false

  run l.is_integer 0.10
  assert_success
  assert_output false

  run l.is_integer 10.0
  assert_success
  assert_output false

  run l.is_integer 99.99
  assert_success
  assert_output false
}

@test "l.is_integer, negative floats" {
  run l.is_integer -0.0
  assert_success
  assert_output false

  run l.is_integer -0.1
  assert_success
  assert_output false

  run l.is_integer -0.10
  assert_success
  assert_output false

  run l.is_integer -10.0
  assert_success
  assert_output false

  run l.is_integer -99.99
  assert_success
  assert_output false
}

@test "l.is_integer, a-zA-Z" {
  run l.is_integer a
  assert_success
  assert_output false

  run l.is_integer z
  assert_success
  assert_output false

  run l.is_integer A
  assert_success
  assert_output false

  run l.is_integer Z
  assert_success
  assert_output false
}


@test "l.is_integer, symbols" {
  run l.is_integer -
  assert_success
  assert_output false
}
