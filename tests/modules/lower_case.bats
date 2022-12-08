#!/usr/bin/env bats

setup_fixture

@test "l.lower_case 'abc'" {
  run l.lower_case 'abc'
  assert_success
  assert_output 'abc'
}

@test "l.lower_case 'ABC DE'" {
  run l.lower_case 'ABC DE'
  assert_success
  assert_output 'abc de'
}

@test "l.lower_case ' ABC DE '" {
  run l.lower_case ' ABC DE '
  assert_success
  assert_output ' abc de '
}

@test "l.lower_case 'a Bc d'" {
  run l.lower_case 'a Bc d'
  assert_success
  assert_output 'a bc d'
}
