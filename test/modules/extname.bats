#!/usr/bin/env bats

setup_fixture
load_module extname

@test "extname file.name" {
  run extname file.name
  assert_success
  assert_output .name
}

@test "extname file.jpg" {
  run extname file.jpg
  assert_success
  assert_output .jpg
}

@test "extname .git" {
  run extname .git
  assert_success
  assert_output ''
}

@test "extname ''" {
  run extname ''
  assert_success
  assert_output ''
}

@test "extname 'haha.'" {
  run extname 'haha.'
  assert_success
  assert_output '.'
}

@test "extname '.'" {
  run extname '.'
  assert_success
  assert_output ''
}

@test "extname file" {
  run extname file
  assert_success
  assert_output ''
}
