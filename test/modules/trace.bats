#!/usr/bin/env bats

setup_fixture
load_module trace

@test "l.trace without label" {
  local result
  result=$(l.trace | head -n2)
  assert_equal "$result" $'Trace:\n  # Function (File:Line)'
}

@test "l.trace with label" {
  local result
  result=$(l.trace label | head -n2)
  assert_equal "$result" $'Trace: label\n  # Function (File:Line)'
}
