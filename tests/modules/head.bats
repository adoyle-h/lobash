#!/usr/bin/env bats

setup_fixture

@test "printf 'a\nb\nc\nd\n' | l.head 2" {
  local expect=(a b)
  t() {
    printf 'a\nb\nc\nd\n' | l.head 2
  }
  run t

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"
  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "printf 'a\nb\nc\nd\n' | l.head 20" {
  local expect=(a b c d)
  t() {
    printf 'a\nb\nc\nd\n' | l.head 20
  }
  run t

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"
  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.head 2 < <(printf 'a\nb\nc\nd\n')" {
  local expect=(a b)
  t() {
    l.head 2 < <(printf 'a\nb\nc\nd\n')
  }
  run t

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"
  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}
