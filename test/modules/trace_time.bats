#!/usr/bin/env bats

setup_fixture
load_module trace_time
load_module starts_with

@test "l.trace_time without label twice between 1 seconds" {
  l.trace_time
  sleep 1
  run l.trace_time
  assert_success

  read -r lines <<< "${output[@]}"
  assert_equal "${#lines[@]}" 3
  assert_equal "$(l.starts_with "${lines[0]}" '[debug] Current Timestamp: ')" true
  assert_equal "$(l.starts_with "${lines[1]}" '[debug] Last Timestamp: ')" true
  assert_equal "$(l.starts_with "${lines[2]}" '[debug] Elapsed: ')" true
}

@test "l.trace_time with two labels twice between 1 seconds" {
  l.trace_time a
  l.trace_time b
  sleep 1
  run l.trace_time a
  assert_success

  read -r lines <<< "${output[@]}"
  assert_equal "${#lines[@]}" 3
  assert_equal "$(l.starts_with "${lines[0]}" '[a] Current Timestamp: ')" true
  assert_equal "$(l.starts_with "${lines[1]}" '[a] Last Timestamp: ')" true
  assert_equal "$(l.starts_with "${lines[2]}" '[a] Elapsed: ')" true

  sleep 1
  run l.trace_time b
  assert_success

  read -r lines <<< "${output[@]}"
  assert_equal "${#lines[@]}" 3
  assert_equal "$(l.starts_with "${lines[0]}" '[b] Current Timestamp: ')" true
  assert_equal "$(l.starts_with "${lines[1]}" '[b] Last Timestamp: ')" true
  assert_equal "$(l.starts_with "${lines[2]}" '[b] Elapsed: ')" true
}
