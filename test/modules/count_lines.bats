#!/usr/bin/env bats

setup_fixture
load_module count_lines

@test "l.count_lines ''" {
  run l.count_lines ''
  assert_success
  assert_output 0
}

@test "l.count_lines '\n'" {
  run l.count_lines '\n'
  assert_success
  assert_output 1
}

@test "l.count_lines <(printf '')" {
  run l.count_lines <(printf '')
  assert_success
  assert_output 0
}

@test "l.count_lines <(printf '\n')" {
  run l.count_lines <(printf '\n')
  assert_success
  assert_output 1
}

@test "printf '\n' | l.count_lines" {
  test() {
    printf '\n' | l.count_lines
  }
  run test
  assert_success
  assert_output 1
}

@test "l.count_lines %s\n%s" {
  run l.count_lines "$(printf '%s\n%s' a b)"
  assert_success
  assert_output 1
}

@test "l.count_lines %s\n%s\n" {
  run l.count_lines "$(printf '%s\n%s\n' a b)"
  assert_success
  assert_output 2
}

@test "l.count_lines %s\n%s\n\n" {
  run l.count_lines "$(printf '%s\n%s\n\n' a b)"
  assert_success
  assert_output 3
}

@test "l.count_lines %s\n\n%s\n\n" {
  run l.count_lines "$(printf '%s\n\n%s\n\n' a b)"
  assert_success
  assert_output 4
}

@test "l.count_lines %s\n\n\n\n%s" {
  run l.count_lines "$(printf '%s\n\n\n\n%s' a b)"
  assert_success
  assert_output 4
}

@test "printf '%s\n%s\n' a b | l.count_lines" {
  test() {
    printf '%s\n%s\n' a b | l.count_lines
  }
  run test
  assert_success
  assert_output 2
}

@test "printf '%s\n%s' a b | l.count_lines" {
  test() {
    printf '%s\n%s' a b | l.count_lines
  }
  run test
  assert_success
  assert_output 1
}

@test "l.count_lines <(printf '%s\n%s' a b)" {
  run l.count_lines <(printf '%s\n%s' a b)
  assert_success
  assert_output 1
}

@test "l.count_lines <(printf '%s\n%s\n' a b)" {
  run l.count_lines <(printf '%s\n%s\n' a b)
  assert_success
  assert_output 2
}
