#!/usr/bin/env bats

setup_fixture

@test "echo true | l.not.s.p" {
  t() {
    echo true | l.not.s.p
  }
  run t
  assert_success
  assert_output false
}

@test "echo false | l.not.s.p" {
  t() {
    echo false | l.not.s.p
  }
  run t
  assert_success
  assert_output true
}

@test "echo '' | l.not.s.p" {
  t() {
    echo '' | l.not.s.p
  }
  run t
  assert_failure 3
  assert_output "Invalid condition! It must be one of 'true' and 'false'. Current value="
}

@test "echo 'xxx' | l.not.s.p" {
  t() {
    echo 'xxx' | l.not.s.p
  }
  run t
  assert_failure 3
  assert_output "Invalid condition! It must be one of 'true' and 'false'. Current value=xxx"
}
