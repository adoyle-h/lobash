#!/usr/bin/env bats

setup_fixture
load_module has

@test "has command cat" {
  run has command cat
  assert_success
  assert_output true
}

@test "has command aaaa" {
  run has command aaaa
  assert_success
  assert_output false
}

@test "has not command cat" {
  run has not command cat
  assert_success
  assert_output false
}

@test "has not command aaaa" {
  run has not command aaaa
  assert_success
  assert_output true
}
