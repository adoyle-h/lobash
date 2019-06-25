#!/usr/bin/env bats

setup_fixture
load_module random

@test "l.random" {
  run l.random
  assert_equal "${#output}" 10
}

@test "l.random 1" {
  run l.random 1
  assert_equal "${#output}" 1
}

@test "l.random 20" {
  run l.random 20
  assert_equal "${#output}" 20
}

@test "l.random 20 '0-9'" {
  run l.random 20 '0-9'
  assert_equal "${#output}" 20
  assert_output -e '^[0-9]+$'
}

@test "l.random 20 'A-Z'" {
  run l.random 20 'A-Z'
  assert_equal "${#output}" 20
  assert_output -e '^[A-Z]+$'
}
