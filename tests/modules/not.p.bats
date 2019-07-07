#!/usr/bin/env bats

setup_fixture
test_prepare not.p
load_module not.p

@test "echo true | l.not.p" {
  t() {
    echo true | l.not.p
  }
  run t
  assert_success
  assert_output false
}

@test "echo false | l.not.p" {
  t() {
    echo false | l.not.p
  }
  run t
  assert_success
  assert_output true
}

@test "echo '' | l.not.p" {
  t() {
    echo '' | l.not.p
  }
  run t
  assert_failure 3
  assert_output "Invalid condition! It must be one of 'true' and 'false'. Current value="
}

@test "echo 'xxx' | l.not.p" {
  t() {
    echo 'xxx' | l.not.p
  }
  run t
  assert_failure 3
  assert_output "Invalid condition! It must be one of 'true' and 'false'. Current value=xxx"
}
