#!/usr/bin/env bats

setup_fixture
load_module trace

@test "l.trace without label" {
  run l.trace
  assert_success
  assert_line -n 0    'Trace:'
  assert_line -n 1    '  # Function (File:Line)'
  assert_line -n 2 -e '^  - .+'
}

@test "l.trace with label" {
  run l.trace label
  assert_success
  assert_line -n 0    'Trace: label'
  assert_line -n 1    '  # Function (File:Line)'
  assert_line -n 2 -e '^  - .+'
}
