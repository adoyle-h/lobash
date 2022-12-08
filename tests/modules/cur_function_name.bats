#!/usr/bin/env bats

setup_fixture

@test "l.cur_function_name" {
  foo() {
    l.cur_function_name
  }

  run foo
  assert_success
  assert_output "foo"

  bar() {
    foo
  }
  run bar
  assert_success
  assert_output "foo"
}
