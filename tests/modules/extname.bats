#!/usr/bin/env bats

setup_fixture
test_prepare extname
load_module extname

@test "l.extname file.name" {
  run l.extname file.name
  assert_success
  assert_output .name
}

@test "l.extname .git" {
  run l.extname .git
  assert_success
  assert_output ''
}

@test "l.extname ''" {
  run l.extname ''
  assert_success
  assert_output ''
}

@test "l.extname 'haha.'" {
  run l.extname 'haha.'
  assert_success
  assert_output '.'
}

@test "l.extname '.'" {
  run l.extname '.'
  assert_success
  assert_output ''
}

@test "l.extname file" {
  run l.extname file
  assert_success
  assert_output ''
}
