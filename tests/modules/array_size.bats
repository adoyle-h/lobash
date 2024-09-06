#!/usr/bin/env bats

setup_fixture

@test "l.array_size <array>" {
  local array=(a b c)
  run l.array_size array
  assert_success
  assert_output 3
}

@test "l.array_size <array> ''" {
  local array=('')
  run l.array_size array
  assert_success
  assert_output 1
}

@test "l.array_size <associative array>" {
  local -A array=([a]=1 [b]=2 [k]=5 [c]=3)
  run l.array_size array
  assert_success
  assert_output 4
}

@test "l.array_size <associative array> ''" {
  local -A array=([a]=1 [b]='' [k]=5 [c]=3)
  run l.array_size array
  assert_success
  assert_output 4
}
