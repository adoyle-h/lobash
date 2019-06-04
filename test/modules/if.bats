#!/usr/bin/env bats

setup_fixture
load_module if

@test "l.if foo foo.then foo.else when failed" {
  foo() {
    return 10;
  }
  foo.then() {
    echo 1
  }
  foo.else() {
    echo 2
  }

  run l.if foo foo.then foo.else
  assert_success
  assert_output 2
}

@test "l.if foo foo.then when failed" {
  foo() {
    return 10;
  }
  foo.then() {
    echo 1
  }

  run l.if foo foo.then
  assert_success
  assert_output ''
}

@test "l.if foo foo.then when success" {
  foo() {
    return 0;
  }
  foo.then() {
    echo 1
  }

  run l.if foo foo.then
  assert_success
  assert_output 1
}

@test "l.if 0 foo.then foo.else" {
  foo() {
    return 0;
  }
  foo.then() {
    echo 1
  }
  foo.else() {
    echo 2
  }

  run l.if 0 foo.then foo.else
  assert_success
  assert_output 1
}

@test "l.if 1 foo.then foo.else" {
  foo() {
    return 0;
  }
  foo.then() {
    echo 1
  }
  foo.else() {
    echo 2
  }

  run l.if 0 foo.then foo.else
  assert_success
  assert_output 1
}
