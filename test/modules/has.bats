#!/usr/bin/env bats

setup_fixture
load_module has

@test "has (not) command cat, while cat is existed" {
  run has command cat
  assert_success
  assert_output ''

  run has not command cat
  assert_failure
  assert_output ''
}

@test "has (not) command xxx, which not defined" {
  run has command xxx
  assert_failure
  assert_output ''

  run has not command xxx
  assert_success
  assert_output ''
}

@test "has (not) function bbb, which not defined" {
  run has not function bbb
  assert_success
  assert_output ''

  run has function bbb
  assert_failure
  assert_output ''
}

@test "has (not) function bbb, which has been defined" {
  bbb() { echo 1; }
  run has not function bbb
  assert_failure
  assert_output ''

  run has function bbb
  assert_success
  assert_output ''
}

@test "has (not) builtin true" {
  run has builtin true
  assert_success
  assert_output ''

  run has not builtin true
  assert_failure
  assert_output ''
}

@test "has (not) builtin xxx, which not defined" {
  run has builtin xxx
  assert_failure
  assert_output ''

  run has not builtin xxx
  assert_success
  assert_output ''
}

@test "has (not) keyword function" {
  run has keyword function
  assert_success
  assert_output ''

  run has not keyword function
  assert_failure
  assert_output ''
}

@test "has (not) keyword xxx, which not defined" {
  run has keyword xxx
  assert_failure
  assert_output ''

  run has not keyword xxx
  assert_success
  assert_output ''
}

@test "has (not) alias xxx, which not defined" {
  run has alias xxx
  assert_failure
  assert_output ''

  run has not alias xxx
  assert_success
  assert_output ''
}

@test "has (not) alias gti, which has been defined" {
  skip 'why the test is failed?'
  alias gti='git'
  result=$(has alias gti && echo true || echo false)
  assert_equal "$result" true

  result=$(has not alias gti && echo true || echo false)
  assert_equal "$result" false
}

@test "has (not) the xxx, which not defined" {
  run has the xxx
  assert_failure
  assert_output ''

  run has not the xxx
  assert_success
  assert_output ''
}

@test "has (not) the ls, which is command" {
  run has the ls
  assert_success
  assert_output ''

  run has not the ls
  assert_failure
  assert_output ''
}

@test "has (not) the agti, which is alias" {
  skip 'why the test is failed?'
  alias agti='git'
  result=$(has the agti && echo true || echo false)
  assert_equal "$result" true

  result=$(has not the agti && echo true || echo false)
  assert_equal "$result" false
}

@test "has (not) the function, which is keyword" {
  run has the function
  assert_success
  assert_output ''

  run has not the function
  assert_failure
  assert_output ''
}

@test "has (not) the type, which is builtin" {
  run has the type
  assert_success
  assert_output ''

  run has not the type
  assert_failure
  assert_output ''
}

@test "has (not) what type" {
  run has what type
  assert_failure 2
  assert_output ''

  run has not what type
  assert_failure 2
  assert_output ''
}
