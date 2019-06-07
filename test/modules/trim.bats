#!/usr/bin/env bats

setup_fixture
load_module trim

@test "l.trim" {
  run l.trim
  assert_failure 1
  assert_output -p ': $1'
}

@test "l.trim ''" {
  run l.trim ''
  assert_success
  assert_output ''
}

@test "l.trim 'hah  '" {
  run l.trim 'hah  '
  assert_success
  assert_output "hah"
}

@test "l.trim 'hah'" {
  run l.trim 'hah'
  assert_success
  assert_output "hah"
}

@test "l.trim 'hah   '" {
  run l.trim 'hah   '
  assert_success
  assert_output "hah"
}

@test "l.trim '   hah   '" {
  run l.trim '   hah   '
  assert_success
  assert_output "hah"
}

@test "l.trim '   hah  bbb '" {
  run l.trim '   hah  bbb '
  assert_success
  assert_output "hah  bbb"
}
