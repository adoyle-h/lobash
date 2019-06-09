#!/usr/bin/env bats

setup_fixture
load_module dirname

@test "l.dirname /" {
  run l.dirname /
  assert_success
  assert_output '/'
}

@test "l.dirname ../" {
  run l.dirname ../
  assert_success
  assert_output '.'
}

@test "l.dirname hello.world" {
  run l.dirname hello.world
  assert_success
  assert_output '.'
}

@test "l.dirname .world" {
  run l.dirname .world
  assert_success
  assert_output '.'
}

@test "l.dirname /a/b/c/hello.world" {
  run l.dirname /a/b/c/hello.world
  assert_success
  assert_output '/a/b/c'
}

@test "l.dirname ./a/b/c/hello.world" {
  run l.dirname ./a/b/c/hello.world
  assert_success
  assert_output './a/b/c'
}
