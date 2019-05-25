#!/usr/bin/env bats

setup_fixture
load_module trim

@test "trim_start" {
  result="$(trim_start '  hah')"
  assert_equal "$result" "hah"
}

@test "trim_end" {
  result="$(trim_end 'aha  ')"
  assert_equal "$result" "aha"
}

@test "trim" {
  result="$(trim '  hahaha  ')"
  assert_equal "$result" "hahaha"
}
