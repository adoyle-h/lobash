#!/usr/bin/env bats

setup_fixture

@test "printf '' | l.count_lines.p" {
  test() {
    printf '' | l.count_lines.p
  }
  run test
  assert_success
  assert_output 0
}

@test "printf '\n' | l.count_lines.p" {
  test() {
    printf '\n' | l.count_lines.p
  }
  run test
  assert_success
  assert_output 1
}

@test "printf 'a' | l.count_lines.p" {
  test() {
    printf 'a' | l.count_lines.p
  }
  run test
  assert_success
  assert_output 0
}

@test "printf '1\n2' | l.count_lines.p" {
  test() {
    printf '1\n2' | l.count_lines.p
  }
  run test
  assert_success
  assert_output 1
}

@test "printf '1\n2\n' | l.count_lines.p" {
  test() {
    printf '1\n2\n' | l.count_lines.p
  }
  run test
  assert_success
  assert_output 2
}

@test "printf '1\n2\n\n' | l.count_lines.p" {
  test() {
    printf '1\n2\n\n' | l.count_lines.p
  }
  run test
  assert_success
  assert_output 3
}

@test "printf '1\n\n\n\n2' | l.count_lines.p" {
  test() {
    printf '1\n\n\n\n2' | l.count_lines.p
  }
  run test
  assert_success
  assert_output 4
}
