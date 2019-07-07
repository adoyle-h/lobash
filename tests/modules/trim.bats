#!/usr/bin/env bats

setup_fixture
test_prepare trim
load_module trim

@test "l.trim" {
  run l.trim
  assert_success
  assert_output ''
}

@test "l.trim ''" {
  run l.trim ''
  assert_success
  assert_output ''
}

@test "l.trim 'n1  '" {
  run l.trim 'n1  '
  assert_success
  assert_output "n1"
}

@test "l.trim 'n2'" {
  run l.trim 'n2'
  assert_success
  assert_output "n2"
}

@test "l.trim '   n3   '" {
  run l.trim '   n3   '
  assert_success
  assert_output "n3"
}

@test "l.trim '   n  4  '" {
  run l.trim '   n  4  '
  assert_success
  assert_output "n  4"
}
