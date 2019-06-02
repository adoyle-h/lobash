#!/usr/bin/env bats

setup_fixture
load_module debug_time

setup() {
  SECONDS=0
}

@test "l.debug_time without label in 1 seconds" {
  l.debug_time
  sleep 1
  run l.debug_time
  assert_success
  assert_output \
    "$(printf '%s\n%s\n%s\n' '[debug] Current seconds: 1' \
      '[debug] Last seconds: 0' \
      '[debug] Elapsed: 1')"
}

@test "l.debug_time without label in 2 seconds" {
  l.debug_time
  sleep 2
  run l.debug_time
  assert_success
  assert_output \
    "$(printf '%s\n%s\n%s\n' '[debug] Current seconds: 2' \
      '[debug] Last seconds: 0' \
      '[debug] Elapsed: 2')"
}

@test "l.debug_time with two labels in 1 seconds" {
  l.debug_time a
  l.debug_time b
  sleep 2
  run l.debug_time a
  assert_success
  assert_output \
    "$(printf '%s\n%s\n%s\n' '[a] Current seconds: 2' \
      '[a] Last seconds: 0' \
      '[a] Elapsed: 2')"

  sleep 1
  run l.debug_time b
  assert_success
  assert_output \
    "$(printf '%s\n%s\n%s\n' '[b] Current seconds: 3' \
      '[b] Last seconds: 0' \
      '[b] Elapsed: 3')"
}
