#!/usr/bin/env bats

setup_fixture
test_prepare is_executable_file.s
load_module is_executable_file.s

@test "l.is_executable_file.s a normal file" {
  local temp=$(mktemp)
  run l.is_executable_file.s "$temp"
  assert_success
  assert_output false
}

@test "l.is_executable_file.s a executable file" {
  local temp=$(mktemp)
  chmod +x "$temp"
  run l.is_executable_file.s "$temp"
  assert_success
  assert_output true
}

@test "l.is_executable_file.s a directory" {
  local temp=$(mktemp -d)
  run l.is_executable_file.s "$temp"
  assert_success
  # interesting https://superuser.com/a/168583
  assert_output false
}

@test "l.is_executable_file.s unexist path" {
  run l.is_executable_file.s /not-exist
  assert_success
  assert_output false
}
