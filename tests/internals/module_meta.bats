#!/usr/bin/env bats

setup_fixture

@test "_lobash.semver_compare 4.0 4.4" {
  run _lobash.semver_compare 4.0 4.4
  assert_success
  assert_output '-1'
}

@test "_lobash.semver_compare 4.4 4.0" {
  run _lobash.semver_compare 4.4 4.0
  assert_success
  assert_output '1'
}


@test "_lobash.semver_compare 4.4 4.4" {
  run _lobash.semver_compare 4.4 4.4
  assert_success
  assert_output '0'
}
