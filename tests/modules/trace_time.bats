#!/usr/bin/env bats

setup_fixture

@test "l.trace_time without label twice between 1 seconds" {
  l.trace_time
  sleep 1
  run l.trace_time
  assert_success
  assert_equal "${#lines[@]}" 3
  assert_line -n 0 -e '^\[debug\] Current Timestamp: [0-9]+$'
  assert_line -n 1 -e '^\[debug\] Last Timestamp: [0-9]+$'
  assert_line -n 2 -e '^\[debug\] Elapsed: [0-9]+$'
}

@test "l.trace_time with two labels twice between 1 seconds" {
  l.trace_time a
  l.trace_time b
  sleep 1

  run l.trace_time a
  assert_success
  assert_equal "${#lines[@]}" 3
  assert_line -n 0 -e '^\[a\] Current Timestamp: [0-9]+$'
  assert_line -n 1 -e '^\[a\] Last Timestamp: [0-9]+$'
  assert_line -n 2 -e '^\[a\] Elapsed: [0-9]+$'

  sleep 1
  run l.trace_time b
  assert_success
  assert_equal "${#lines[@]}" 3
  assert_line -n 0 -e '^\[b\] Current Timestamp: [0-9]+$'
  assert_line -n 1 -e '^\[b\] Last Timestamp: [0-9]+$'
  assert_line -n 2 -e '^\[b\] Elapsed: [0-9]+$'

}
