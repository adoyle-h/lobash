#!/usr/bin/env bats

setup_fixture
load_module parse_args

@test "l.parse_args opts args \"$@\"" {
  local opts args
  t() {
    l.parse_args opts args "$@"
  }

  t -x 3 -y 4 -n5 -abc --beep=boop foo bar baz

  assert_equal "$?" 0
  assert_equal "${#opts[@]}" 7
  assert_equal "${opts[x]}" '3'
  assert_equal "${opts[y]}" '4'
  assert_equal "${opts[n]}" '5'
  assert_equal "${opts[a]}" 'true'
  assert_equal "${opts[b]}" 'true'
  assert_equal "${opts[c]}" 'true'
  assert_equal "${opts[beep]}" 'boop'
  assert_equal "${#args[@]}" 3
  assert_equal "${args[0]}" 'foo'
  assert_equal "${args[1]}" 'bar'
  assert_equal "${args[2]}" 'baz'
}

@test "l.parse_args _ args \"$@\"" {
  local args
  t() {
    l.parse_args _ args "$@"
  }

  t -x 3 -y 4 -n5 -abc --beep=boop foo bar baz

  assert_equal "$?" 0
  assert_equal "${#args[@]}" 3
  assert_equal "${args[0]}" 'foo'
  assert_equal "${args[1]}" 'bar'
  assert_equal "${args[2]}" 'baz'
}

@test "l.parse_args opts _ \"$@\"" {
  local opts
  t() {
    l.parse_args opts _ "$@"
  }

  t -x 3 -y 4 -n5 -abc --beep=boop foo bar baz

  assert_equal "$?" 0
  assert_equal "${#opts[@]}" 7
  assert_equal "${opts[x]}" '3'
  assert_equal "${opts[y]}" '4'
  assert_equal "${opts[n]}" '5'
  assert_equal "${opts[a]}" 'true'
  assert_equal "${opts[b]}" 'true'
  assert_equal "${opts[c]}" 'true'
  assert_equal "${opts[beep]}" 'boop'
}
