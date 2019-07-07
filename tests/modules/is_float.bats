#!/usr/bin/env bats

setup_fixture
test_prepare is_float
load_module is_float

@test "l.is_float, integers" {
  run l.is_float 0
  assert_success
  assert_output true

  run l.is_float 1
  assert_success
  assert_output true

  run l.is_float 10
  assert_success
  assert_output true

  run l.is_float 9999
  assert_success
  assert_output true
}

@test "l.is_float, negative integers" {
  run l.is_float -0
  assert_success
  assert_output true

  run l.is_float -1
  assert_success
  assert_output true

  run l.is_float -10
  assert_success
  assert_output true

  run l.is_float -9999
  assert_success
  assert_output true
}

@test "l.is_float, floats" {
  run l.is_float 0.0
  assert_success
  assert_output true

  run l.is_float 0.1
  assert_success
  assert_output true

  run l.is_float 0.10
  assert_success
  assert_output true

  run l.is_float 10.0
  assert_success
  assert_output true

  run l.is_float 99.99
  assert_success
  assert_output true
}

@test "l.is_float, negative floats" {
  run l.is_float -0.0
  assert_success
  assert_output true

  run l.is_float -0.1
  assert_success
  assert_output true

  run l.is_float -0.10
  assert_success
  assert_output true

  run l.is_float -10.0
  assert_success
  assert_output true

  run l.is_float -99.99
  assert_success
  assert_output true
}

@test "l.is_float, a-zA-Z" {
  run l.is_float a
  assert_success
  assert_output false

  run l.is_float z
  assert_success
  assert_output false

  run l.is_float A
  assert_success
  assert_output false

  run l.is_float Z
  assert_success
  assert_output false
}


@test "l.is_float, symbols" {
  run l.is_float -
  assert_success
  assert_output false
}
