#!/usr/bin/env bats

setup_fixture
test_prepare upper_case.p
load_module upper_case.p

@test "echo '' | l.upper_case.p" {
  t() {
    echo '' | l.upper_case.p
  }
  run t
  assert_success
  assert_output ''
}

@test "echo 'abc' | l.upper_case.p" {
  t() {
    echo 'abc' | l.upper_case.p
  }
  run t
  assert_success
  assert_output 'ABC'
}

@test "echo 'ABC' | l.upper_case.p" {
  t() {
    echo 'ABC' | l.upper_case.p
  }
  run t
  assert_success
  assert_output 'ABC'
}

@test "echo ' abc de ' | l.upper_case.p" {
  t() {
    echo ' abc de ' | l.upper_case.p
  }
  run t
  assert_success
  assert_output ' ABC DE '
}

@test "echo 'a A bC D' | l.upper_case.p" {
  t() {
    echo 'a A bC D' | l.upper_case.p
  }
  run t
  assert_success
  assert_output 'A A BC D'
}
