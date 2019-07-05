#!/usr/bin/env bats

setup_fixture
test_prepare upper_case
load_module upper_case

@test "l.upper_case" {
  run l.upper_case
  assert_success
  assert_output ''
}

@test "l.upper_case 'abc'" {
  run l.upper_case 'abc'
  assert_success
  assert_output 'ABC'
}

@test "l.upper_case 'ABC'" {
  run l.upper_case 'ABC'
  assert_success
  assert_output 'ABC'
}

@test "l.upper_case ' abc de '" {
  run l.upper_case ' abc de '
  assert_success
  assert_output ' ABC DE '
}

@test "l.upper_case 'a A bC D'" {
  run l.upper_case 'a A bC D'
  assert_success
  assert_output 'A A BC D'
}
