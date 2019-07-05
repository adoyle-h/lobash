#!/usr/bin/env bats

setup_fixture
test_prepare trace_start
load_module trace_start

@test "l.trace_start" {
  # How to test PS4?
  run l.trace_start
  assert_success
  assert_output ''
}

@test "l.trace_start 1" {
  # How to test PS4?
  run l.trace_start 1
  assert_success
  assert_output ''

}
@test "l.trace_start 2" {
  # How to test PS4?
  run l.trace_start 2
  assert_success
  assert_output ''
}

@test "l.trace_start 3" {
  # How to test PS4?
  run l.trace_start 3
  assert_success
  assert_output ''
}

@test "l.trace_start 1 label" {
  # How to test PS4?
  run l.trace_start 1 label
  assert_success
  assert_output ''
}
