#!/usr/bin/env bats

setup_fixture

@test "l.last (a asd bcd d)" {
  local a=(a asd bcd d)
  run l.last a
  assert_success
  assert_output d
}

@test "l.last (a asd 'bcd d')" {
  local a=(a asd 'bcd d')
  run l.last a
  assert_success
  assert_output "bcd d"
}

@test "l.last ()" {
  local a=()
  run l.last a
  assert_success
  assert_output ""
}

@test "l.last (a asd bcd d) 2" {
  local a=(a asd bcd d)
  local expect=(bcd d)
  run l.last a 2

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"

  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.last (a asd bcd d) 5" {
  local a=(a asd bcd d)
  local expect=(a asd bcd d)
  run l.last a 5

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"

  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.last (a asd 'bcd d') 2" {
  local a=(a asd 'bcd d')
  local expect=(asd 'bcd d')
  run l.last a 2

  assert_success
  assert_equal "${#lines[@]}" "${#expect[@]}"

  local i
  for (( i = 0; i < ${#expect[@]}; i++ )); do
    assert_line -n "$i" "${expect[$i]}"
  done
}

@test "l.last () 2" {
  local a=()
  run l.last a
  assert_success
  assert_equal "${#lines[@]}" 0
  assert_output ''
}
