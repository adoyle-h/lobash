#!/usr/bin/env bats

setup_fixture

@test "printf 'a\nb\nc\n' | l.each.p fn" {
  local expect=( '0=a' '1=b' '2=c' )
  fn() { echo "$2=$1"; }
  t() {
    printf 'a\nb\nc\n' | l.each.p fn
  }
  run t

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"

  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.each.p fn < <(printf 'a\nb\nc\n')" {
  local expect=( '0=a' '1=b' '2=c' )
  fn() { echo "$2=$1"; }
  t() {
    l.each.p fn < <(printf 'a\nb\nc\n')
  }
  run t

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"

  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}
