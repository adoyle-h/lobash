#!/usr/bin/env bats

setup_fixture
load_module count_lines

@test "l.count_lines ''" {
  run l.count_lines ''
  assert_success
  assert_output 0
}

@test "printf '' | l.count_lines" {
  test() {
    printf '' | l.count_lines
  }
  run test
  assert_success
  assert_output 0
}

@test "l.count_lines '\n'" {
  run l.count_lines '\n'
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

@test "l.count_lines 'a'" {
  test() {
    printf 'a' | l.count_lines
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

@test "l.count_lines '1\n2'" {
  test() {
    printf '1\n2' | l.count_lines
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

@test "l.count_lines '1\n2\n'" {
  test() {
    printf '1\n2\n' | l.count_lines
  }
  run test
  assert_success
  assert_output 2
}

@test "printf '1\n2\n' | l.count_lines" {
  test() {
    printf '1\n2\n' | l.count_lines
  }
  run test
  assert_success
  assert_output 2
}

@test "l.count_lines '1\n2\n\n'" {
  test() {
    printf '1\n2\n\n' | l.count_lines
  }
  run test
  assert_success
  assert_output 3
}

@test "printf '1\n2\n\n' | l.count_lines" {
  test() {
    printf '1\n2\n\n' | l.count_lines
  }
  run test
  assert_success
  assert_output 3
}

@test "l.count_lines '1\n\n\n\n2'" {
  test() {
    printf '1\n\n\n\n2' | l.count_lines
  }
  run test
  assert_success
  assert_output 4
}

@test "printf '1\n\n\n\n2' | l.count_lines" {
  test() {
    printf '1\n\n\n\n2' | l.count_lines
  }
  run test
  assert_success
  assert_output 4
}
