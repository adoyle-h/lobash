#!/usr/bin/env bats

setup_fixture
load_module lower_case.p

@test "echo 'abc' | l.lower_case.p" {
  t() {
    echo 'abc' | l.lower_case.p
  }
  run t
  assert_success
  assert_output 'abc'
}

@test "echo 'ABC DE' | l.lower_case.p" {
  t() {
    echo 'ABC DE' | l.lower_case.p
  }
  run t
  assert_success
  assert_output 'abc de'
}

@test "echo ' ABC DE ' | l.lower_case.p" {
  t() {
    echo ' ABC DE ' | l.lower_case.p
  }
  run t
  assert_success
  assert_output ' abc de '
}

@test "echo 'a Bc d' | l.lower_case.p" {
  t() {
    echo 'a Bc d' | l.lower_case.p
  }
  run t
  assert_success
  assert_output 'a bc d'
}
