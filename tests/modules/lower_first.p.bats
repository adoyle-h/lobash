#!/usr/bin/env bats

setup_fixture
test_prepare lower_first.p
load_module lower_first.p

@test "echo 'abc' | l.lower_first.p" {
  t() {
    echo 'abc' | l.lower_first.p
  }
  run t
  assert_success
  assert_output 'abc'
}

@test "echo 'Abc' | l.lower_first.p" {
  t() {
    echo 'Abc' | l.lower_first.p
  }
  run t
  assert_success
  assert_output 'abc'
}

@test "echo 'ABc' | l.lower_first.p" {
  t() {
    echo 'ABc' | l.lower_first.p
  }
  run t
  assert_success
  assert_output 'aBc'
}

@test "echo 'ABC DE' | l.lower_first.p" {
  t() {
    echo 'ABC DE' | l.lower_first.p
  }
  run t
  assert_success
  assert_output 'aBC DE'
}

@test "echo ' ABC DE ' | l.lower_first.p" {
  t() {
    echo ' ABC DE ' | l.lower_first.p
  }
  run t
  assert_success
  assert_output ' ABC DE '
}
