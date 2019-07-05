#!/usr/bin/env bats

setup_fixture
test_prepare lower_first
load_module lower_first

@test "l.lower_first 'abc'" {
  run l.lower_first 'abc'
  assert_success
  assert_output 'abc'
}

@test "l.lower_first 'Abc'" {
  run l.lower_first 'Abc'
  assert_success
  assert_output 'abc'
}

@test "l.lower_first 'ABc'" {
  run l.lower_first 'ABc'
  assert_success
  assert_output 'aBc'
}

@test "l.lower_first 'ABC DE'" {
  run l.lower_first 'ABC DE'
  assert_success
  assert_output 'aBC DE'
}

@test "l.lower_first ' ABC DE '" {
  run l.lower_first ' ABC DE '
  assert_success
  assert_output ' ABC DE '
}
