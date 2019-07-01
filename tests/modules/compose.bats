#!/usr/bin/env bats

setup_fixture
load_module compose

@test "l.compose foo bar baz" {
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

@test "l.compose bar baz" {
  bar() {
    echo "bar"
  }

  baz() {
    echo "baz=$1"
  }

  run l.compose bar baz
  assert_success
  assert_output "baz=bar"
}

@test "l.compose str bar baz" {
  bar() {
    echo "bar=$1"
  }

  baz() {
    echo "baz=$1"
  }

  run l.compose str bar baz
  assert_success
  assert_output "baz=bar=str"
}

@test "l.compose (return 3) bar baz" {
  bar() {
    echo "bar=$1"
    return 3
  }

  baz() {
    echo "baz=$1"
  }

  run l.compose str bar baz
  assert_failure 3
  assert_output ""
}
