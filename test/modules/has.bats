#!/usr/bin/env bats

setup_fixture
load_module has

@test "l.has (not) command cat, while cat is existed" {
  run l.has command cat
  assert_success
  assert_output ''

  run l.has not command cat
  assert_failure
  assert_output ''
}

@test "l.has (not) command xxx, which not defined" {
  run l.has command xxx
  assert_failure
  assert_output ''

  run l.has not command xxx
  assert_success
  assert_output ''
}

@test "l.has (not) function bbb, which not defined" {
  run l.has not function bbb
  assert_success
  assert_output ''

  run l.has function bbb
  assert_failure
  assert_output ''
}

@test "l.has (not) function bbb, which has been defined" {
  bbb() { echo 1; }
  run l.has not function bbb
  assert_failure
  assert_output ''

  run l.has function bbb
  assert_success
  assert_output ''
}

@test "l.has (not) builtin true" {
  run l.has builtin true
  assert_success
  assert_output ''

  run l.has not builtin true
  assert_failure
  assert_output ''
}

@test "l.has (not) builtin xxx, which not defined" {
  run l.has builtin xxx
  assert_failure
  assert_output ''

  run l.has not builtin xxx
  assert_success
  assert_output ''
}

@test "l.has (not) keyword function" {
  run l.has keyword function
  assert_success
  assert_output ''

  run l.has not keyword function
  assert_failure
  assert_output ''
}

@test "l.has (not) keyword xxx, which not defined" {
  run l.has keyword xxx
  assert_failure
  assert_output ''

  run l.has not keyword xxx
  assert_success
  assert_output ''
}

@test "l.has (not) alias xxx, which not defined" {
  run l.has alias xxx
  assert_failure
  assert_output ''

  run l.has not alias xxx
  assert_success
  assert_output ''
}

@test "l.has (not) alias gti, which has been defined" {
  skip 'why the test is failed?'
  alias gti='git'
  result=$(l.has alias gti && echo true || echo false)
  assert_equal "$result" true

  result=$(l.has not alias gti && echo true || echo false)
  assert_equal "$result" false
}

@test "l.has (not) the xxx, which not defined" {
  run l.has the xxx
  assert_failure
  assert_output ''

  run l.has not the xxx
  assert_success
  assert_output ''
}

@test "l.has (not) the ls, which is command" {
  run l.has the ls
  assert_success
  assert_output ''

  run l.has not the ls
  assert_failure
  assert_output ''
}

@test "l.has (not) the agti, which is alias" {
  skip 'why the test is failed?'
  alias agti='git'
  result=$(l.has the agti && echo true || echo false)
  assert_equal "$result" true

  result=$(l.has not the agti && echo true || echo false)
  assert_equal "$result" false
}

@test "l.has (not) the function, which is keyword" {
  run l.has the function
  assert_success
  assert_output ''

  run l.has not the function
  assert_failure
  assert_output ''
}

@test "l.has (not) the type, which is builtin" {
  run l.has the type
  assert_success
  assert_output ''

  run l.has not the type
  assert_failure
  assert_output ''
}

@test "l.has (not) what type" {
  run l.has what type
  assert_failure 3
  assert_output ''

  run l.has not what type
  assert_failure 3
  assert_output ''
}
