#!/usr/bin/env bats

setup_fixture

@test "echo hello.world | l.basename.p" {
  t() {
    echo hello.world | l.basename.p
  }
  run t
  assert_success
  assert_output 'hello.world'
}

@test "echo .world | l.basename.p" {
  t() {
    echo .world | l.basename.p
  }
  run t
  assert_success
  assert_output '.world'
}

@test "echo ./hello.world | l.basename.p" {
  t() {
    echo ./hello.world | l.basename.p
  }
  run t
  assert_success
  assert_output 'hello.world'
}

@test "echo /a/b/c/hello.world | l.basename.p" {
  t() {
    echo /a/b/c/hello.world | l.basename.p
  }
  run t
  assert_success
  assert_output 'hello.world'
}
