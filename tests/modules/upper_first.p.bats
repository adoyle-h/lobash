#!/usr/bin/env bats

setup_fixture
test_prepare upper_first.p
load_module upper_first.p

@test "echo 'abc' | l.upper_first.p" {
  t() {
    echo 'abc' | l.upper_first.p
  }
  run t
  assert_success
  assert_output 'Abc'
}

@test "echo 'ABC' | l.upper_first.p" {
  t() {
    echo 'ABC' | l.upper_first.p
  }
  run t
  assert_success
  assert_output 'ABC'
}

@test "echo 'abc de' | l.upper_first.p" {
  t() {
    echo 'abc de' | l.upper_first.p
  }
  run t
  assert_success
  assert_output 'Abc de'
}

@test "echo ' abc de ' | l.upper_first.p" {
  t() {
    echo ' abc de ' | l.upper_first.p
  }
  run t
  assert_success
  assert_output ' abc de '
}

@test "echo 'a bc d' | l.upper_first.p" {
  t() {
    echo 'a bc d' | l.upper_first.p
  }
  run t
  assert_success
  assert_output 'A bc d'
}
