#!/usr/bin/env bats

setup_fixture

@test "l.has command cat, while cat is existed" {
  run l.has command cat
  assert_success
  assert_output ''
}

@test "l.has command xxx, which not defined" {
  run l.has command xxx
  assert_failure
  assert_output ''
}

@test "l.has function bbb, which not defined" {
  run l.has function bbb
  assert_failure
  assert_output ''
}

@test "l.has function bbb, which has been defined" {
  bbb() { echo 1; }

  run l.has function bbb
  assert_success
  assert_output ''
}

@test "l.has builtin true" {
  run l.has builtin true
  assert_success
  assert_output ''
}

@test "l.has builtin xxx, which not defined" {
  run l.has builtin xxx
  assert_failure
  assert_output ''
}

@test "l.has keyword function" {
  run l.has keyword function
  assert_success
  assert_output ''
}

@test "l.has keyword xxx, which not defined" {
  run l.has keyword xxx
  assert_failure
  assert_output ''
}

@test "l.has alias xxx, which not defined" {
  run l.has alias xxx
  assert_failure
  assert_output ''
}

@test "l.has alias gti, which has been defined" {
  shopt -s expand_aliases

  alias gti='git'
  run l.has alias gti
  assert_success
  assert_output ''

  shopt -u expand_aliases
}

@test "l.has the xxx, which not defined" {
  run l.has the xxx
  assert_failure
  assert_output ''
}

@test "l.has the ls, which is command" {
  run l.has the ls
  assert_success
  assert_output ''
}

@test "l.has the agti, which is alias" {
  shopt -s expand_aliases

  alias agti='git'
  run l.has the agti
  assert_success
  assert_output ''

  shopt -u expand_aliases
}

@test "l.has the function, which is keyword" {
  run l.has the function
  assert_success
  assert_output ''
}

@test "l.has the type, which is builtin" {
  run l.has the type
  assert_success
  assert_output ''
}

@test "l.has what type" {
  run l.has what type
  assert_failure 3
  assert_output 'Invalid Condition: what'
}
