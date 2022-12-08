#!/usr/bin/env bats

setup_fixture

@test "l.is_executable.s a normal file" {
  local temp=$(mktemp)
  run l.is_executable.s "$temp"
  assert_success
  assert_output false
}

@test "l.is_executable.s a executable file" {
  local temp=$(mktemp)
  chmod +x "$temp"
  run l.is_executable.s "$temp"
  assert_success
  assert_output true
}

@test "l.is_executable.s a directory" {
  local temp=$(mktemp -d)
  run l.is_executable.s "$temp"
  assert_success
  # interesting https://superuser.com/a/168583
  assert_output true
}

@test "l.is_executable.s unexist path" {
  run l.is_executable.s /not-exist
  assert_success
  assert_output false
}
