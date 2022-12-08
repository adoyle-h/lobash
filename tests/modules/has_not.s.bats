#!/usr/bin/env bats

setup_fixture

@test "l.has_not.s the gti, which is an alias" {
  shopt -s expand_aliases

  alias gti='git'
  result=$(l.has_not.s the gti)
  assert_equal "$result" false

  shopt -u expand_aliases
}

@test "l.has_not.s command cat, while cat is existed" {
  run l.has_not.s command cat
  assert_success
  assert_output false
}

@test "l.has_not.s command xxx, which not defined" {
  run l.has_not.s command xxx
  assert_success
  assert_output true
}

@test "l.has_not.s function bbb, which not defined" {
  run l.has_not.s function bbb
  assert_success
  assert_output true
}

@test "l.has_not.s function bbb, which has been defined" {
  bbb() { echo 1; }
  run l.has_not.s function bbb
  assert_success
  assert_output false
}

@test "l.has_not.s builtin true" {
  run l.has_not.s builtin true
  assert_success
  assert_output false
}

@test "l.has_not.s builtin xxx, which not defined" {
  run l.has_not.s builtin xxx
  assert_success
  assert_output true
}

@test "l.has_not.s keyword function" {
  run l.has_not.s keyword function
  assert_success
  assert_output false
}

@test "l.has_not.s keyword xxx, which not defined" {
  run l.has_not.s keyword xxx
  assert_success
  assert_output true
}

@test "l.has_not.s alias xxx, which not defined" {
  run l.has_not.s alias xxx
  assert_success
  assert_output true
}

@test "l.has_not.s the xxx, which not defined" {
  run l.has_not.s the xxx
  assert_success
  assert_output true
}

@test "l.has_not.s the ls, which is command" {
  run l.has_not.s the ls
  assert_success
  assert_output false
}

@test "l.has_not.s the function, which is keyword" {
  run l.has_not.s the function
  assert_success
  assert_output false
}

@test "l.has_not.s the type, which is builtin" {
  run l.has_not.s the type
  assert_success
  assert_output false
}

@test "l.has_not.s what type" {
  test() {
    set -e
    l.has_not.s what type
  }
  run test
  assert_failure 3
  assert_output 'Invalid Condition: what'
}

@test "result=\$(l.has_not.s what type)" {
  foo() {
    set -e;
    local r
    r=$(l.has_not.s what type)
    if [[ $r == true ]]; then
      echo 13
    else
      echo 14
    fi
  }

  run foo
  assert_failure 3
  assert_line -n 0 'Invalid Condition: what'
}
