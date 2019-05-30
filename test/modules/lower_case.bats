#!/usr/bin/env bats

setup_fixture
load_module lower_case

@test "l.lower_case 'abc'" {
  run l.lower_case 'abc'
  assert_success
  assert_output 'abc'
}

@test "l.lower_case 'Abc'" {
  run l.lower_case 'Abc'
  assert_success
  assert_output 'abc'
}

@test "l.lower_case 'ABc'" {
  run l.lower_case 'ABc'
  assert_success
  assert_output 'abc'
}

@test "l.lower_case 'ABC'" {
  run l.lower_case 'ABC'
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

@test "l.lower_case 'a bc d'" {
  run l.lower_case 'a bc d'
  assert_success
  assert_output 'a bc d'
}

@test "l.lower_case 'a Bc d'" {
  run l.lower_case 'a Bc d'
  assert_success
  assert_output "a bc d"
}
