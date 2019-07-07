#!/usr/bin/env bats

setup_fixture
test_prepare benchmark
load_module benchmark

@test "l.benchmark" {
  foo() {
    dirname /a/b/c/bash
  }

  run l.benchmark foo 5
  assert_success

  assert_line -n 0 "Benchmarking: Run command 'foo' [5] times."
  assert_line -n 1 '============='
  assert_line -n 3 'foo () '
  assert_line -n 4 '{ '
  assert_line -n 5 '    dirname /a/b/c/bash'
  assert_line -n 6 '}'
  assert_line -n 7 '============='
  assert_line -n 8 -p 'real'
  assert_line -n 9 -p 'user'
  assert_line -n 10 -p 'sys'
  assert_line -n 11 '--------------------------'
}
