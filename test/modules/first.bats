#!/usr/bin/env bats

setup_fixture
load_module first

@test "first a asd bcd d" {
  run first a asd bcd d
  assert_success
  assert_output a
}

@test "first 'a asd' bcd d" {
  run first 'a asd' bcd d
  assert_success
  assert_output "a asd"
}
