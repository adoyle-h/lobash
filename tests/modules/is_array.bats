#!/usr/bin/env bats

setup_fixture
test_prepare is_array
load_module is_array

@test "l.is_array array" {
  local -a y=(a h)
  run l.is_array y
  assert_success
  assert_output ''

  local y2=(a h)
  run l.is_array y2
  assert_success
  assert_output ''

  # Skip testing uninitialized variable for bash 4.3
  if [[ ! $BASH_VERSION =~ ^'4.3' ]]; then
    local -a y3
    run l.is_array y3
    assert_success
    assert_output ''
  fi
}

@test "l.is_array export array" {
  local -a yyy1=(a h)
  export yyy1
  run l.is_array yyy1
  assert_success
  assert_output ''

  local yyy2=(a h)
  export yyy2
  run l.is_array yyy2
  assert_success
  assert_output ''

  local -A yyy3=([a]=1)
  export yyy3
  run l.is_array yyy3
  assert_success
  assert_output ''

  # Skip testing uninitialized variable for bash 4.3
  if [[ ! $BASH_VERSION =~ ^'4.3' ]]; then
    local -a yyy11
    export yyy11
    run l.is_array yyy11
    assert_success
    assert_output ''

    local yyy22
    export yyy22
    run l.is_array yyy22
    assert_failure
    assert_output ''

    local -A yyy33
    export yyy33
    run l.is_array yyy33
    assert_success
    assert_output ''
  fi
}

@test "l.is_array variable which has many attributes" {
  declare -ilrtux yy11=1
  run l.is_array yy11
  assert_failure
  assert_output ''

  declare -ailrtux yy22=()
  run l.is_array yy22
  assert_success
  assert_output ''

  declare -Ailrtux yy33=()
  run l.is_array yy33
  assert_success
  assert_output ''

  # Skip testing uninitialized variable for bash 4.3
  if [[ ! $BASH_VERSION =~ ^'4.3' ]]; then
    declare -ilrtux yy1
    run l.is_array yy1
    assert_failure
    assert_output ''

    declare -ailrtux yy2
    run l.is_array yy2
    assert_success
    assert_output ''

    declare -Ailrtux yy3
    run l.is_array yy3
    assert_success
    assert_output ''
  fi
}

@test "l.is_array associate array" {
  local -A A=([a]=1)
  run l.is_array A
  assert_success
  assert_output ''
}

@test "l.is_array uninitialized array" {
  if [[ $BASH_VERSION =~ ^'4.3' ]]; then skip; fi

  local -a a
  run l.is_array a
  assert_success
  assert_output ''

  local -A A
  run l.is_array A
  assert_success
  assert_output ''

  local b
  run l.is_array b
  assert_failure
  assert_output ''
}

@test "l.is_array number" {
  local -i y=1
  run l.is_array y
  assert_failure
  assert_output ''

  local y2=2
  run l.is_array y2
  assert_failure
  assert_output ''
}

@test "l.is_array string" {
  local y=string
  run l.is_array y
  assert_failure
  assert_output ''
}

@test "l.is_array ''" {
  run l.is_array ''
  assert_failure
  assert_output ''
}

@test "l.is_array" {
  run l.is_array
  assert_failure
  assert_output ''
}

@test "l.is_array undefined variable" {
  run l.is_array kkkkkkkkkkkkkkkkkk  # A long name in case of exported variable from outside
  assert_failure
  assert_output ''
}
