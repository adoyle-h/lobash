#!/usr/bin/env bats

setup_fixture

@test "l.if foo foo.then foo.else when failed" {
  foo() {
    echo false;
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
    echo false;
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
    echo true;
  }
  foo.then() {
    echo 1
  }

  run l.if foo foo.then
  assert_success
  assert_output 1
}

@test "l.if 0 foo.then foo.else" {
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


@test "l.if true foo.then foo.else" {
  foo.then() {
    echo 1
  }
  foo.else() {
    echo 2
  }

  run l.if true foo.then foo.else
  assert_success
  assert_output 1
}

@test "l.if false foo.then foo.else" {
  foo.then() {
    echo 1
  }
  foo.else() {
    echo 2
  }

  run l.if false foo.then foo.else
  assert_success
  assert_output 2
}

@test "l.if foo foo.then foo.else when foo return 2" {
  foo() {
    return 2
  }

  foo.then() {
    echo 1
  }
  foo.else() {
    echo 2
  }

  run l.if foo foo.then foo.else
  assert_failure 2
  assert_output ''
}
