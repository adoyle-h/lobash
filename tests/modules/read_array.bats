#!/usr/bin/env bats

setup_fixture

@test "l.read_array out < <(printf 'a\nb\nc\n')" {
  local out=()
  local expect=(a b c)

  l.read_array out < <(printf 'a\nb\nc\n')

  assert_equal $? 0
  assert_equal "$IFS" $' \t\n'
  assert_array out expect
}

@test "IFS=' ' l.read_array out < <(printf 'a\nb\nc\n')" {
  # shellcheck disable=2034
  local out=()
  # shellcheck disable=2034
  local expect=(a b c)

  IFS=' ' l.read_array out < <(printf 'a\nb\nc\n')

  assert_equal $? 0
  assert_equal "$IFS" $' \t\n'
  assert_array out expect
}
