#!/usr/bin/env bats

setup_fixture

@test "l.seq fn 1 5" {
  local expect=( 1 2 3 4 5 )
  fn() { echo "$1"; }
  run l.seq fn 1 5

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"

  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.seq fn 0 7 3" {
  local expect=( 0 3 6 )
  fn() { echo "$1"; }
  run l.seq fn 0 7 3

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"

  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.seq fn 5 1" {
  local expect=( 5 4 3 2 1 )
  fn() { echo "$1"; }
  run l.seq fn 5 1

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"

  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.seq fn 5 1 3" {
  local expect=( 5 2 )
  fn() { echo "$1"; }
  run l.seq fn 5 1 3

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"

  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.seq fn 1 1" {
  local expect=( 1 )
  fn() { echo "$1"; }
  run l.seq fn 1 1

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"

  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.seq fn 01 10 2" {
  local expect=( 01 03 05 07 09 )
  fn() { echo "$1"; }
  run l.seq fn 01 10 2

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"
  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.seq fn 10 01 4" {
  local expect=( 10 06 02 )
  fn() { echo "$1"; }
  run l.seq fn 10 01 4

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"
  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}
