#!/usr/bin/env bats

setup_fixture
load_module strict_has

@test 'if [[ l.strict_has == true ]]' {
  test() {
    if [[ $(l.strict_has command cat) == true ]]; then
      echo 1
    else
      echo 2
    fi
  }
  run test
  assert_success
  assert_output 1

  test() {
    if [[ $(l.strict_has command xxcat) == true ]]; then
      echo 1
    else
      echo 2
    fi
  }
  run test
  assert_success
  assert_output 2
}

@test "l.strict_has the agti, which is an alias" {
  shopt -s expand_aliases

  alias gti='git'
  result=$(l.strict_has the gti)
  assert_equal "$result" true

  shopt -u expand_aliases
}

@test "l.strict_has command cat, while cat is existed" {
  run l.strict_has command cat
  assert_success
  assert_output true
}

@test "l.strict_has command xxx, which not defined" {
  run l.strict_has command xxx
  assert_success
  assert_output false
}

@test "l.strict_has function bbb, which not defined" {
  run l.strict_has function bbb
  assert_success
  assert_output false
}

@test "l.strict_has function bbb, which has been defined" {
  bbb() { echo 1; }
  run l.strict_has function bbb
  assert_success
  assert_output true
}

@test "l.strict_has builtin true" {
  run l.strict_has builtin true
  assert_success
  assert_output true
}

@test "l.strict_has builtin xxx, which not defined" {
  run l.strict_has builtin xxx
  assert_success
  assert_output false
}

@test "l.strict_has keyword function" {
  run l.strict_has keyword function
  assert_success
  assert_output true
}

@test "l.strict_has keyword xxx, which not defined" {
  run l.strict_has keyword xxx
  assert_success
  assert_output false
}

@test "l.strict_has alias xxx, which not defined" {
  run l.strict_has alias xxx
  assert_success
  assert_output false
}

@test "l.strict_has the xxx, which not defined" {
  run l.strict_has the xxx
  assert_success
  assert_output false
}

@test "l.strict_has the ls, which is command" {
  run l.strict_has the ls
  assert_success
  assert_output true
}

@test "l.strict_has the function, which is keyword" {
  run l.strict_has the function
  assert_success
  assert_output true
}

@test "l.strict_has the type, which is builtin" {
  run l.strict_has the type
  assert_success
  assert_output true
}

@test "l.strict_has what type" {
  run l.strict_has what type
  assert_failure 2
  assert_output ''
}

@test "result=\$(l.strict_has what type)" {
  foo() {
    if [[ $(l.strict_has what type) == true ]]; then
      echo 1
    else
      echo 2
    fi
    result=$()
  }

  run foo
  assert_success
  assert_output 2
}
