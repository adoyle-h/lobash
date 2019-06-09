#!/usr/bin/env bats

setup_fixture
load_module extname

@test "l.extname file.name" {
  run l.extname file.name
  assert_success
  assert_output .name
}

@test "echo 'file.name' | l.extname" {
  t() {
    echo 'file.name' | l.extname
  }
  run t
  assert_success
  assert_output .name
}

@test "l.extname .git" {
  run l.extname .git
  assert_success
  assert_output ''
}

@test "echo '.git' | l.extname" {
  t() {
    echo '.git' | l.extname
  }
  run t
  assert_success
  assert_output ''
}

@test "l.extname ''" {
  run l.extname ''
  assert_success
  assert_output ''
}

@test "echo '' | l.extname" {
  t() {
    echo '' | l.extname
  }
  run t
  assert_success
  assert_output ''
}

@test "l.extname 'haha.'" {
  run l.extname 'haha.'
  assert_success
  assert_output '.'
}

@test "echo 'haha.' | l.extname" {
  t() {
    echo 'haha.' | l.extname
  }
  run t
  assert_success
  assert_output '.'
}

@test "l.extname '.'" {
  run l.extname '.'
  assert_success
  assert_output ''
}

@test "echo '.' | l.extname" {
  t() {
    echo '.' | l.extname
  }
  run t
  assert_success
  assert_output ''
}

@test "l.extname file" {
  run l.extname file
  assert_success
  assert_output ''
}

@test "echo 'file' | l.extname" {
  t() {
    echo 'file' | l.extname
  }
  run t
  assert_success
  assert_output ''
}
