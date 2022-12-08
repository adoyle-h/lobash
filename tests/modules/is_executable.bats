#!/usr/bin/env bats

setup_fixture

@test "l.is_executable a normal file" {
  local temp=$(mktemp)
  run l.is_executable "$temp"
  assert_failure
  assert_output ''
}

@test "l.is_executable a executable file" {
  local temp=$(mktemp)
  chmod +x "$temp"
  run l.is_executable "$temp"
  assert_success
  assert_output ''
}

@test "l.is_executable a directory" {
  local temp=$(mktemp -d)
  run l.is_executable "$temp"
  assert_success
  # interesting https://superuser.com/a/168583
  assert_output ''
}

@test "l.is_executable unexist path" {
  run l.is_executable /not-exist
  assert_failure
  assert_output ''
}
