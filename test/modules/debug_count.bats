#!/usr/bin/env bats

setup_fixture
load_module debug_count

@test "l.debug_count without label" {
  local result
  result=$(l.debug_count)
  assert_equal "$result" '[debug] count: 1'

  l.debug_count
  run l.debug_count
  assert_output '[debug] count: 2'
}

@test "l.debug_count with label" {
  run l.debug_count haha
  assert_success
  assert_output '[haha] count: 1'

  l.debug_count haha
  run l.debug_count haha
  assert_success
  assert_output '[haha] count: 2'
}


@test "l.debug_count with multi label" {
  l.debug_count

  l.debug_count haha

  l.debug_count wow

  run l.debug_count haha
  assert_success
  assert_output '[haha] count: 2'

  run l.debug_count wow
  assert_success
  assert_output '[wow] count: 2'

  run l.debug_count
  assert_success
  assert_output '[debug] count: 2'
}
