#!/usr/bin/env bats

setup_fixture
load_module compose

@test "l.compose" {
  foo() {
    dirname /a/b/c/bash
  }

  bar() {
    echo "bar=$1"
  }

  baz() {
    echo "baz=$1"
  }

  run l.compose foo bar baz
  assert_success
  assert_output "baz=bar=/a/b/c"
}

@test "l.compose" {
  bar() {
    echo "bar=$1"
  }

  baz() {
    echo "baz=$1"
  }

  run l.compose foo bar baz
  assert_success
  assert_output "baz=bar=foo"
}

@test "l.compose" {
  bar() {
    echo "bar=$1"
    return 3
  }

  baz() {
    echo "baz=$1"
  }

  run l.compose foo bar baz
  assert_success
  assert_output "baz=bar=foo"
}
