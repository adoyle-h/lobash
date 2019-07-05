#!/usr/bin/env bats

setup_fixture
test_prepare date
load_module date

@test "l.date '%s'" {
  run l.date '%s'
  assert_equal "${#output}" 10
  assert_output -e '^[0-9]+$'
}


@test "l.date '%H:%M:%S'" {
  run l.date '%H:%M:%S'
  assert_equal "${#output}" 8
  assert_output -e '^[0-9]{2}:[0-9]{2}:[0-9]{2}$'
}
