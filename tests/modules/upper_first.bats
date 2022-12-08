#!/usr/bin/env bats

setup_fixture

@test "l.upper_first 'abc'" {
  run l.upper_first 'abc'
  assert_success
  assert_output 'Abc'
}

@test "l.upper_first 'ABC'" {
  run l.upper_first 'ABC'
  assert_success
  assert_output 'ABC'
}

@test "l.upper_first 'abc de'" {
  run l.upper_first 'abc de'
  assert_success
  assert_output 'Abc de'
}

@test "l.upper_first ' abc de '" {
  run l.upper_first ' abc de '
  assert_success
  assert_output ' abc de '
}

@test "l.upper_first 'a bc d'" {
  run l.upper_first 'a bc d'
  assert_success
  assert_output 'A bc d'
}
