#!/usr/bin/env bats

setup_fixture

_setup() {
  load_module read_array
}

@test "< <(l.array_reverse)" {
  # shellcheck disable=2034
  local arr=(a b c d)
  local out=()
  local expect=(d c b a)

  l.read_array out < <(l.array_reverse arr)

  assert_equal $? 0
  assert_array out expect

  # shellcheck disable=2034
  local arr2=(1 2 3 4)
  local out2=()
  local expect2=(4 3 2 1)

  l.read_array out2 < <(l.array_reverse arr2)

  assert_equal $? 0
  assert_array out2 expect2
}

@test "l.array_reverse <input> <output>" {
  # shellcheck disable=2034
  local arr=(a b c d)
  # shellcheck disable=2034
  local out=()
  # shellcheck disable=2034
  local expect=(d c b a)

  l.array_reverse arr out

  assert_equal $? 0
  assert_array out expect

  # shellcheck disable=2034
  local arr2=(1 2 3 4)
  # shellcheck disable=2034
  local out2=()
  # shellcheck disable=2034
  local expect2=(4 3 2 1)

  l.array_reverse arr2 out2

  assert_equal $? 0
  assert_array out2 expect2
}
