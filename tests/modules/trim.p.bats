#!/usr/bin/env bats

setup_fixture
test_prepare trim.p
load_module trim.p

@test "echo '' | l.trim.p" {
  t() {
    echo '' | l.trim.p
  }
  run t
  assert_success
  assert_output ''
}

@test "echo 'n1  ' | l.trim.p" {
  t() {
    echo 'n1  ' | l.trim.p
  }
  run t
  assert_success
  assert_output 'n1'
}

@test "echo 'n2' | l.trim.p" {
  t() {
    echo 'n2' | l.trim.p
  }
  run t
  assert_success
  assert_output 'n2'
}

@test "echo '   n3   ' | l.trim.p" {
  t() {
    echo '   n3   ' | l.trim.p
  }
  run t
  assert_success
  assert_output 'n3'
}

@test "echo '   n  4   ' | l.trim.p" {
  t() {
    echo '   n  4   ' | l.trim.p
  }
  run t
  assert_success
  assert_output 'n  4'
}
