#!/usr/bin/env bats

setup_fixture
load_module ends_with

@test "l.ends_with hello o" {
  run l.ends_with "hello" "o"
  assert_success
  assert_output true
}

@test "l.ends_with hello oo" {
  run l.ends_with "hello" "oo"
  assert_success
  assert_output false
}

@test "l.ends_with hello hello" {
  run l.ends_with "hello" "hello"
  assert_success
  assert_output true
}

@test "l.ends_with file.bash .bash" {
  run l.ends_with "file.bash" ".bash"
  assert_success
  assert_output true
}

@test "l.ends_with file.bash ''" {
  run l.ends_with "file.bash" ""
  assert_success
  assert_output true
}

@test "l.ends_with 'file bash' 'sh'" {
  run l.ends_with "file bash" "sh"
  assert_success
  assert_output true
}

@test "l.ends_with 'file bash' ' bash '" {
  run l.ends_with "file bash" " bash "
  assert_success
  assert_output false
}

@test "l.ends_with 'file bash' 'bash '" {
  run l.ends_with "file bash" "bash "
  assert_success
  assert_output false
}

@test "l.ends_with 'file bash' ' bash'" {
  run l.ends_with "file bash" " bash"
  assert_success
  assert_output true
}

@test "l.ends_with 'file bash' 'file'" {
  run l.ends_with "file bash" "file"
  assert_success
  assert_output false
}
