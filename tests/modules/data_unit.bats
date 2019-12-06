#!/usr/bin/env bats

setup_fixture
test_prepare data_unit
load_module data_unit

@test "l.data_unit 1000 K M" {
  run l.data_unit 1000 K M
  assert_success
  assert_output 1
}

@test "l.data_unit 1024 Kib Mib" {
  run l.data_unit 1024 Kib Mib
  assert_success
  assert_output 1
}

@test "l.data_unit 1 Mib Kib" {
  run l.data_unit 1 Mib Kib
  assert_success
  assert_output 1024
}
