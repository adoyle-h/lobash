#!/usr/bin/env bats

setup_fixture
load_module choose


@test "l.choose a b. Enter 2" {
  test() {
    echo 2 | l.choose a b
  }
  run test
  assert_success
  assert_line -n 0 -e '- 1.+a'
  assert_line -n 1 -e '- 2.+b'
  assert_line -n 2 'b'
}

@test "l.choose a b. Enter 0" {
  test() {
    echo 0 | l.choose a b
  }
  run test
  assert_failure 4
  assert_line -n 2 'Invalid choose number: 0'
}

@test "l.choose a b. Enter 3" {
  test() {
    echo 3 | l.choose a b
  }
  run test
  assert_failure 4
  assert_line -n 2 'Invalid choose number: 3'
}

@test "l.choose a b. Enter a" {
  test() {
    echo a | l.choose a b
  }
  run test
  assert_failure 3
  assert_line -n 2 'Must enter an integer. Current: a'
}

@test "l.choose a b c d e f g h i j k l m n o p q r s t" {
  test() {
    echo 20 | l.choose a b c d e f g h i j k l m n o p q r s t
  }
  run test
  assert_success
  assert_line -n 0 -e '- 1.+a'
  assert_line -n 1 -e '- 2.+b'
  assert_line -n 19 -e '- 20.+t'
  assert_line -n 20 't'
}
