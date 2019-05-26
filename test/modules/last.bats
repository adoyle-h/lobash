#!/usr/bin/env bats

setup_fixture
load_module last

@test "last a asd bcd d" {
  run last a asd bcd d
  assert_success
  assert_output d
}

@test "last a asd 'bcd d'" {
  run last a asd 'bcd d'
  assert_success
  assert_output "bcd d"
}
