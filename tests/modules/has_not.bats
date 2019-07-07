#!/usr/bin/env bats

setup_fixture
test_prepare has_not
load_module has_not

@test "l.has_not command cat, while cat is existed" {
  run l.has_not command cat
  assert_failure
  assert_output ''
}

@test "l.has_not command xxx, which not defined" {
  run l.has_not command xxx
  assert_success
  assert_output ''
}

@test "l.has_not function bbb, which not defined" {
  run l.has_not function bbb
  assert_success
  assert_output ''
}

@test "l.has_not function bbb, which has been defined" {
  bbb() { echo 1; }
  run l.has_not function bbb
  assert_failure
  assert_output ''
}

@test "l.has_not builtin true" {
  run l.has_not builtin true
  assert_failure
  assert_output ''
}

@test "l.has_not builtin xxx, which not defined" {
  run l.has_not builtin xxx
  assert_success
  assert_output ''
}

@test "l.has_not keyword function" {
  run l.has_not keyword function
  assert_failure
  assert_output ''
}

@test "l.has_not keyword xxx, which not defined" {
  run l.has_not keyword xxx
  assert_success
  assert_output ''
}

@test "l.has_not alias xxx, which not defined" {
  run l.has_not alias xxx
  assert_success
  assert_output ''
}

@test "l.has_not alias gti, which has been defined" {
  shopt -s expand_aliases

  alias gti='git'
  run l.has_not alias gti
  assert_failure
  assert_output ''

  shopt -u expand_aliases
}

@test "l.has_not the xxx, which not defined" {
  run l.has_not the xxx
  assert_success
  assert_output ''
}

@test "l.has_not the ls, which is command" {
  run l.has_not the ls
  assert_failure
  assert_output ''
}

@test "l.has_not the agti, which is alias" {
  shopt -s expand_aliases

  alias agti='git'
  run l.has_not the agti
  assert_failure
  assert_output ''

  shopt -u expand_aliases
}

@test "l.has_not the function, which is keyword" {
  run l.has_not the function
  assert_failure
  assert_output ''
}

@test "l.has_not the type, which is builtin" {
  run l.has_not the type
  assert_failure
  assert_output ''
}

@test "l.has_not what type" {
  run l.has_not what type
  assert_failure 3
  assert_output 'Invalid Condition: what'
}
