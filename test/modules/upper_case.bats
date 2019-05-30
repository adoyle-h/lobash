#!/usr/bin/env bats

setup_fixture
load_module upper_case

@test "l.upper_case 'abc'" {
  run l.upper_case 'abc'
  assert_success
  assert_output 'ABC'
}

@test "l.upper_case 'Abc'" {
  run l.upper_case 'Abc'
  assert_success
  assert_output 'ABC'
}

@test "l.upper_case 'ABc'" {
  run l.upper_case 'ABc'
  assert_success
  assert_output 'ABC'
}

@test "l.upper_case 'ABC'" {
  run l.upper_case 'ABC'
  assert_success
  assert_output 'ABC'
}

@test "l.upper_case 'abc de'" {
  run l.upper_case 'abc de'
  assert_success
  assert_output 'ABC DE'
}

@test "l.upper_case ' abc de '" {
  run l.upper_case ' abc de '
  assert_success
  assert_output ' ABC DE '
}

@test "l.upper_case 'a bc d'" {
  run l.upper_case 'a bc d'
  assert_success
  assert_output 'A BC D'
}

@test "l.upper_case 'A bC D'" {
  run l.upper_case 'A bC D'
  assert_success
  assert_output "A BC D"
}
