#!/usr/bin/env bats

setup_fixture
load_module union_array

@test "l.union_array two arrays" {
  local arr1=(a b)
  local arr2=(c d)
  run l.union_array arr1 arr2
	assert_success
	assert_output 'a b c d'
}
