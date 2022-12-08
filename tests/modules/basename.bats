#!/usr/bin/env bats

setup_fixture

@test "l.basename hello.world" {
  run l.basename hello.world
  assert_success
  assert_output 'hello.world'
}

@test "l.basename .world" {
  run l.basename .world
  assert_success
  assert_output '.world'
}

@test "l.basename ./hello.world" {
  run l.basename ./hello.world
  assert_success
  assert_output 'hello.world'
}

@test "l.basename /a/b/c/hello.world" {
  run l.basename /a/b/c/hello.world
  assert_success
  assert_output 'hello.world'
}
