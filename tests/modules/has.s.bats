#!/usr/bin/env bats

setup_fixture
test_prepare has.s
load_module has.s

@test 'if [[ l.has.s == true ]]' {
  test() {
    if [[ $(l.has.s command cat) == true ]]; then
      echo 1
    else
      echo 2
    fi
  }
  run test
  assert_success
  assert_output 1

  test() {
    if [[ $(l.has.s command xxcat) == true ]]; then
      echo 1
    else
      echo 2
    fi
  }
  run test
  assert_success
  assert_output 2
}

@test "l.has.s the agti, which is an alias" {
  shopt -s expand_aliases

  alias gti='git'
  result=$(l.has.s the gti)
  assert_equal "$result" true

  shopt -u expand_aliases
}

@test "l.has.s command cat, while cat is existed" {
  run l.has.s command cat
  assert_success
  assert_output true
}

@test "l.has.s command xxx, which not defined" {
  run l.has.s command xxx
  assert_success
  assert_output false
}

@test "l.has.s function bbb, which not defined" {
  run l.has.s function bbb
  assert_success
  assert_output false
}

@test "l.has.s function bbb, which has been defined" {
  bbb() { echo 1; }
  run l.has.s function bbb
  assert_success
  assert_output true
}

@test "l.has.s builtin true" {
  run l.has.s builtin true
  assert_success
  assert_output true
}

@test "l.has.s builtin xxx, which not defined" {
  run l.has.s builtin xxx
  assert_success
  assert_output false
}

@test "l.has.s keyword function" {
  run l.has.s keyword function
  assert_success
  assert_output true
}

@test "l.has.s keyword xxx, which not defined" {
  run l.has.s keyword xxx
  assert_success
  assert_output false
}

@test "l.has.s alias xxx, which not defined" {
  run l.has.s alias xxx
  assert_success
  assert_output false
}

@test "l.has.s the xxx, which not defined" {
  run l.has.s the xxx
  assert_success
  assert_output false
}

@test "l.has.s the ls, which is command" {
  run l.has.s the ls
  assert_success
  assert_output true
}

@test "l.has.s the function, which is keyword" {
  run l.has.s the function
  assert_success
  assert_output true
}

@test "l.has.s the type, which is builtin" {
  run l.has.s the type
  assert_success
  assert_output true
}

@test "l.has.s what type" {
  run l.has.s what type
  assert_failure 3
  assert_output 'Invalid Condition: what'
}

@test "result=\$(l.has.s what type)" {
  foo() {
    set -e;
    local r
    r=$(l.has.s what type)
    if [[ $r == true ]]; then
      echo 4
    else
      echo 5
    fi
  }

  run foo
  assert_failure 3
  assert_line -n 0 'Invalid Condition: what'
}
