#!/usr/bin/env bats

setup_fixture

@test "l.first (a asd bcd d)" {
  local arr=(a asd bcd d)
  run l.first arr
  assert_success
  assert_output 'a'
}

@test "l.first ('a asd' bcd d)" {
  local arr=('a asd' bcd d)
  run l.first arr
  assert_success
  assert_output 'a asd'
}

@test "l.first ()" {
  local arr=()
  run l.first arr
  assert_success
  assert_equal "${#lines[@]}" 0
  assert_output ''
}

@test "l.first (a asd bcd d) 2" {
  local arr=(a asd bcd d)
  local expect=(a asd)
  run l.first arr 2

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"

  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.first (a asd bcd d) 5" {
  local arr=(a asd bcd d)
  local expect=(a asd bcd d)
  run l.first arr 5

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"

  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.first ('a asd' bcd d) 2" {
  local arr=('a asd' bcd d)
  local expect=('a asd' bcd)
  run l.first arr 2

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"

  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.first () 2" {
  local arr=()
  run l.first arr 2
  assert_success
  assert_equal "${#lines[@]}" 0
  assert_output ''
}
