#!/usr/bin/env bats

setup_fixture
load_module benchmark

@test "l.benchmark" {
  skip 'why lines is not an array?'
  foo() {
    dirname /a/b/c/bash
  }

  run l.benchmark foo 5
  assert_success

  read -r -d $'\n' -a lines <<< "${output}"
  assert_equal "${#lines[@]}" 14
  assert_equal "${lines[0]}" "Benchmarking: Run command 'foo' [5] times."
  assert_equal "${lines[1]}" '============='
  assert_equal "${lines[3]}" 'foo ()'
  assert_equal "${lines[4]}" '{'
  assert_equal "${lines[5]}" 'dirname /a/b/c/bash'
  assert_equal "${lines[6]}" '}'
  assert_equal "${lines[7]}" '============='
  assert_equal "${lines[13]}" '--------------------------'
}
