#!/usr/bin/env bats

setup_fixture

@test "l.trace_count without label" {
  local result
  result=$(l.trace_count)
  assert_equal "$result" '[trace] count: 1'

  l.trace_count
  run l.trace_count
  assert_output '[trace] count: 2'
}

@test "l.trace_count with label" {
  run l.trace_count haha
  assert_success
  assert_output '[haha] count: 1'

  l.trace_count haha
  run l.trace_count haha
  assert_success
  assert_output '[haha] count: 2'
}


@test "l.trace_count with multi label" {
  l.trace_count

  l.trace_count haha

  l.trace_count wow

  run l.trace_count haha
  assert_success
  assert_output '[haha] count: 2'

  run l.trace_count wow
  assert_success
  assert_output '[wow] count: 2'

  run l.trace_count
  assert_success
  assert_output '[trace] count: 2'
}
