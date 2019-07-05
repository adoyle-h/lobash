#!/usr/bin/env bats

setup_fixture
test_prepare trace_stack
load_module trace_stack

@test "l.trace_stack without label" {
  t() {
    l.trace_stack
  }
  run t
  assert_success
  assert_line -n 0    'Trace Function Stack:'
  assert_line -n 1    '  # Function (File:Line)'
  assert_line -n 2 -e '^  - t \(.+:[0-9]+\)$'
}

@test "l.trace_stack with label" {
  m() {
    l.trace_stack label
  }

  f() { m; }

  run f
  assert_success
  assert_line -n 0    'Trace Function Stack: label'
  assert_line -n 1    '  # Function (File:Line)'
  assert_line -n 2 -e '^  - m \(.+:[0-9]+\)$'
  assert_line -n 3 -e '^  - f \(.+:[0-9]+\)$'
}
