#!/usr/bin/env bats

setup_fixture
load_module trace_stack

@test "l.trace_stack without label" {
  run l.trace_stack
  assert_success
  assert_line -n 0    'Trace Function Stack:'
  assert_line -n 1    '  # Function (File:Line)'
  assert_line -n 2 -e '^  - .+'
}

@test "l.trace_stack with label" {
  run l.trace_stack label
  assert_success
  assert_line -n 0    'Trace Function Stack: label'
  assert_line -n 1    '  # Function (File:Line)'
  assert_line -n 2 -e '^  - .+'
}
