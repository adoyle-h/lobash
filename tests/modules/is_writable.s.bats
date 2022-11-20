#!/usr/bin/env bats

setup_fixture
test_prepare is_writable.s
load_module is_writable.s

@test "l.is_writable.s a normal file" {
  local temp=$(mktemp)
  run l.is_writable.s "$temp"
  assert_success
  assert_output true
}

@test "l.is_writable.s a executable file" {
  local temp=$(mktemp)
  chmod +x "$temp"
  run l.is_writable.s "$temp"
  assert_success
  assert_output true
}

@test "l.is_writable.s a directory" {
  local temp=$(mktemp -d)
  run l.is_writable.s "$temp"
  assert_success
  # interesting https://superuser.com/a/168583
  assert_output true
}

@test "l.is_writable.s unexist path" {
  run l.is_writable.s /not-exist
  assert_success
  assert_output false
}
