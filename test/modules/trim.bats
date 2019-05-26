#!/usr/bin/env bats

setup_fixture
load_module trim

@test "trim 'hah  '" {
  run trim 'hah  '
  assert_success
  assert_output "hah"
}

@test "trim 'hah'" {
  run trim 'hah'
  assert_success
  assert_output "hah"
}

@test "trim 'hah   '" {
  run trim 'hah   '
  assert_success
  assert_output "hah"
}

@test "trim '   hah   '" {
  run trim '   hah   '
  assert_success
  assert_output "hah"
}

@test "trim '   hah  bbb '" {
  run trim '   hah  bbb '
  assert_success
  assert_output "hah  bbb"
}
