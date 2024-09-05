#!/usr/bin/env bats

setup_fixture

@test "l.var_attrs array" {
  local -a y=(a h)
  run l.var_attrs y
  assert_success
  assert_output 'a'

  local y2=(a h)
  run l.var_attrs y2
  assert_success
  assert_output 'a'

  # Skip testing uninitialized variable for bash 4.3
  if [[ ! $BASH_VERSION =~ ^'4.3' ]]; then
    local -a y3
    run l.var_attrs y3
    assert_success
    assert_output 'a'
  fi
}

@test "l.var_attrs export array" {
  local -a yyy1=(a h)
  export yyy1
  run l.var_attrs yyy1
  assert_success
  assert_output 'ax'

  local yyy2=(a h)
  export yyy2
  run l.var_attrs yyy2
  assert_success
  assert_output 'ax'

  local -A yyy3=([a]=1)
  export yyy3
  run l.var_attrs yyy3
  assert_success
  assert_output 'Ax'

  # Skip testing uninitialized variable for bash 4.3
  if [[ ! $BASH_VERSION =~ ^'4.3' ]]; then
    local -a yyy11
    export yyy11
    run l.var_attrs yyy11
    assert_success
    assert_output 'ax'

    local yyy22
    export yyy22
    run l.var_attrs yyy22
    assert_success
    assert_output 'x'

    local -A yyy33
    export yyy33
    run l.var_attrs yyy33
    assert_success
    assert_output 'Ax'
  fi
}

@test "l.var_attrs variable which has many attributes" {
  declare -irtxl yy11=1
  run l.var_attrs yy11
  assert_success
  assert_output 'irtxl'

  declare -airtxl yy22=()
  run l.var_attrs yy22
  assert_success
  assert_output 'airtxl'

  declare -Airtxl yy33=()
  run l.var_attrs yy33
  assert_success
  assert_output 'Airtxl'

  # Skip testing uninitialized variable for bash 4.3
  if [[ ! $BASH_VERSION =~ ^'4.3' ]]; then
    declare -irtxl yy1
    run l.var_attrs yy1
    assert_success
    assert_output 'irtxl'

    declare -airtxl yy2
    run l.var_attrs yy2
    assert_success
    assert_output 'airtxl'

    declare -Airtxl yy3
    run l.var_attrs yy3
    assert_success
    assert_output 'Airtxl'
  fi
}

@test "l.var_attrs associative array" {
  local -A A=([a]=1)
  run l.var_attrs A
  assert_success
  assert_output 'A'
}

@test "l.var_attrs uninitialized array" {
  if [[ $BASH_VERSION =~ ^'4.3' ]]; then skip; fi

  local -a a
  run l.var_attrs a
  assert_success
  assert_output 'a'

  local -A A
  run l.var_attrs A
  assert_success
  assert_output 'A'

  local b
  run l.var_attrs b
  assert_success
  assert_output ''
}

@test "l.var_attrs number" {
  local -i y=1
  run l.var_attrs y
  assert_success
  assert_output 'i'

  local y2=2
  run l.var_attrs y2
  assert_success
  assert_output ''
}

@test "l.var_attrs string" {
  local y=string
  run l.var_attrs y
  assert_success
  assert_output ''
}

@test "l.var_attrs ''" {
  run l.var_attrs ''
  assert_failure
  assert_output ''
}

@test "l.var_attrs" {
  run l.var_attrs
  assert_failure
  assert_output ''
}

@test "l.var_attrs undefined variable" {
  run l.var_attrs kkkkkkkkkkkkkkkkkk # A long name in case of exported variable from outside
  assert_success
  assert_output ''
}
