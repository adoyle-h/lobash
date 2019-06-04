#!/usr/bin/env bats

setup_fixture
load_module now

@test "l.now, the length of result should be 13" {
  local r
  r="$(l.now)"
  assert_equal "${#r}" 13
}
