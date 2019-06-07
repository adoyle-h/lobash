#!/usr/bin/env bats

setup_fixture
load_module count_lines

@test "l.count_lines ''" {
  run l.count_lines ''
  assert_failure 3
  assert_output "Please use pipe to pass parameter."
}

@test "l.count_lines '\n'" {
  run l.count_lines '\n'
  assert_failure 3
  assert_output "Please use pipe to pass parameter."
}

@test "l.count_lines <(printf '')" {
  run l.count_lines <(printf '')
  assert_failure 3
  assert_output "Please use pipe to pass parameter."
}

@test "printf '' | l.count_lines" {
  test() {
    printf '' | l.count_lines
  }
  run test
  assert_success
  assert_output 0
}

@test "printf 'a' | l.count_lines" {
  test() {
    printf 'a' | l.count_lines
  }
  run test
  assert_success
  assert_output 0
}

@test "printf '\n' | l.count_lines" {
  test() {
    printf '\n' | l.count_lines
  }
  run test
  assert_success
  assert_output 1
}

@test "printf '1\n2' | l.count_lines" {
  test() {
    printf '1\n2' | l.count_lines
  }
  run test
  assert_success
  assert_output 1
}

@test "printf '1\n2\n' | l.count_lines" {
  test() {
    printf '1\n2\n' | l.count_lines
  }
  run test
  assert_success
  assert_output 2
}

@test "printf '1\n2\n\n' | l.count_lines" {
  test() {
    printf '1\n2\n\n' | l.count_lines
  }
  run test
  assert_success
  assert_output 3
}

@test "printf '1\n\n\n\n2' | l.count_lines" {
  test() {
    printf '1\n\n\n\n2' | l.count_lines
  }
  run test
  assert_success
  assert_output 4
}

@test "l.count_lines <<<(printf '1\n2')" {
  run l.count_lines <<<$(printf '1\n2')
  assert_success
  assert_output 1
}

@test "l.count_lines <<<(printf '1\n2\n3\n')" {
  run l.count_lines <<<$(printf '1\n2\n3\n')
  assert_success
  assert_output 3
}
