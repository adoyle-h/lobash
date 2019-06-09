#!/usr/bin/env bats

setup_fixture
load_module trim

@test "l.trim" {
  run l.trim
  assert_success
  assert_output ''
}

@test "l.trim ''" {
  run l.trim ''
  assert_success
  assert_output ''
}

@test "echo '' | l.trim" {
  t() {
    echo '' | l.trim
  }
  run t
  assert_success
  assert_output ''
}

@test "l.trim 'n1  '" {
  run l.trim 'n1  '
  assert_success
  assert_output "n1"
}

@test "echo 'n1  ' | l.trim" {
  t() {
    echo 'n1  ' | l.trim
  }
  run t
  assert_success
  assert_output 'n1'
}

@test "l.trim 'n2'" {
  run l.trim 'n2'
  assert_success
  assert_output "n2"
}

@test "echo 'n2' | l.trim" {
  t() {
    echo 'n2' | l.trim
  }
  run t
  assert_success
  assert_output 'n2'
}

@test "l.trim '   n3   '" {
  run l.trim '   n3   '
  assert_success
  assert_output "n3"
}

@test "echo '   n3   ' | l.trim" {
  t() {
    echo '   n3   ' | l.trim
  }
  run t
  assert_success
  assert_output 'n3'
}

@test "l.trim '   n  4  '" {
  run l.trim '   n  4  '
  assert_success
  assert_output "n  4"
}

@test "echo '   n  4   ' | l.trim" {
  t() {
    echo '   n  4   ' | l.trim
  }
  run t
  assert_success
  assert_output 'n  4'
}
