#!/usr/bin/env bats

setup_fixture

@test "l.each (a b 1 2) fn" {
  # shellcheck disable=2034
  local arr=(a b 1 2)
  local expect=( '0=a' '1=b' '2=1' '3=2' )
  fn() { echo "$2=$1"; }
  run l.each arr fn

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"

  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.each ([hello]=world [foo]=bar) fn" {
  # shellcheck disable=2034
  local -A a=([hello]=world [foo]=bar)
  local expect=( 'hello=world' 'foo=bar' )
  fn() { echo "$2=$1"; }
  run l.each a fn

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"

  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.read_array < <(l.each (a b 1 2) fn)" {
  load_module read_array

  # shellcheck disable=2034
  local arr=(a b 1 2)
  # shellcheck disable=2034
  local out=()
  local expect=( '0=a' '1=b' '2=1' '3=2' )
  fn() { echo "$2=$1"; }
  l.read_array out < <(l.each arr fn)

  assert_equal "$?" 0
  assert_array out expect
}
