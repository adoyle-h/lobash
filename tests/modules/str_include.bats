#!/usr/bin/env bats

setup_fixture

@test "l.str_include hello he" {
  run l.str_include hello he
  assert_success
  assert_output ''
}

@test "l.str_include hello ''" {
  run l.str_include hello ''
  assert_success
  assert_output ''

  local s=''
  run l.str_include hello "$s"
  assert_success
  assert_output ''
}

@test "l.str_include hello ' he'" {
  run l.str_include hello ' he'
  assert_failure
  assert_output ''
}

@test "l.str_include hello 'o '" {
  run l.str_include hello 'o '
  assert_failure
  assert_output ''
}

@test "l.str_include 'hello world' ' '" {
  run l.str_include 'hello world' ' '
  assert_success
  assert_output ''
}

@test "l.str_include 'hello world' 'lo w'" {
  run l.str_include 'hello world' 'lo w'
  assert_success
  assert_output ''
}

@test "l.str_include 'hell\$o world' '$'" {
  t() {
    # shellcheck disable=2016
    l.str_include 'hell$o world' '$'
  }
  run t
  assert_success
  assert_output ''
}

@test "l.str_include '[hello world' '['" {
  run l.str_include '[hello world' '['
  assert_success
  assert_output ''
}
