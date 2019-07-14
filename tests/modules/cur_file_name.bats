#!/usr/bin/env bats

setup_fixture
test_prepare cur_function_name
load_module cur_function_name

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
