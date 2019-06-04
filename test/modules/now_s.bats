#!/usr/bin/env bats

setup_fixture
load_module now_s

@test "l.now_s, the length of result should be 10" {
  local r
  r="$(l.now_s)"
  assert_equal "${#r}" 10
}
