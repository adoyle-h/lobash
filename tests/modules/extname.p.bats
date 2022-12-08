#!/usr/bin/env bats

setup_fixture

@test "echo 'file.name' | l.extname.p" {
  t() {
    echo 'file.name' | l.extname.p
  }
  run t
  assert_success
  assert_output .name
}

@test "echo '.git' | l.extname.p" {
  t() {
    echo '.git' | l.extname.p
  }
  run t
  assert_success
  assert_output ''
}

@test "echo '' | l.extname.p" {
  t() {
    echo '' | l.extname.p
  }
  run t
  assert_success
  assert_output ''
}

@test "echo 'haha.' | l.extname.p" {
  t() {
    echo 'haha.' | l.extname.p
  }
  run t
  assert_success
  assert_output '.'
}

@test "echo '.' | l.extname.p" {
  t() {
    echo '.' | l.extname.p
  }
  run t
  assert_success
  assert_output ''
}

@test "echo 'file' | l.extname.p" {
  t() {
    echo 'file' | l.extname.p
  }
  run t
  assert_success
  assert_output ''
}
