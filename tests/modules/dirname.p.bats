#!/usr/bin/env bats

setup_fixture
load_module dirname.p

@test "echo '/' | l.dirname.p" {
  t() {
    echo '/' | l.dirname.p
  }
  run t
  assert_success
  assert_output '/'
}

@test "echo '../' | l.dirname.p" {
  t() {
    echo '../' | l.dirname.p
  }
  run t
  assert_success
  assert_output '.'
}

@test "echo 'hello.world' | l.dirname.p" {
  t() {
    echo 'hello.world' | l.dirname.p
  }
  run t
  assert_success
  assert_output '.'
}

@test "echo '.world' | l.dirname.p" {
  t() {
    echo '.world' | l.dirname.p
  }
  run t
  assert_success
  assert_output '.'
}

@test "echo '/a/b/c/hello.world' | l.dirname.p" {
  t() {
    echo '/a/b/c/hello.world' | l.dirname.p
  }
  run t
  assert_success
  assert_output '/a/b/c'
}

@test "echo './a/b/c/hello.world' | l.dirname.p" {
  t() {
    echo './a/b/c/hello.world' | l.dirname.p
  }
  run t
  assert_success
  assert_output './a/b/c'
}
