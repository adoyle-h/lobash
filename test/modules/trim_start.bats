#!/usr/bin/env bats

setup_fixture
load_module trim_start

@test "trim_start '  hah'" {
  run trim_start '  hah'
  assert_success
  assert_output "hah"
}

@test "trim_start 'hah'" {
  run trim_start 'hah'
  assert_success
  assert_output "hah"
}

@test "trim_start  'hah   '" {
  run trim_start  'hah   '
  assert_success
  assert_output "hah   "
}

@test "trim_start '   hah   '" {
  run trim_start '   hah   '
  assert_success
  assert_output "hah   "
}

@test "trim_start  '   hah  bbb '" {
  run trim_start '   hah  bbb '
  assert_success
  assert_output "hah  bbb "
}
