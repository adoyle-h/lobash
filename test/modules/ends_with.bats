#!/usr/bin/env bats

setup_fixture
load_module ends_with

@test "ends_with hello o" {
  run ends_with "hello" "o"
  assert_success
  assert_output true
}

@test "ends_with hello oo" {
  run ends_with "hello" "oo"
  assert_success
  assert_output false
}

@test "ends_with hello hello" {
  run ends_with "hello" "hello"
  assert_success
  assert_output true
}

@test "ends_with file.bash .bash" {
  run ends_with "file.bash" ".bash"
  assert_success
  assert_output true
}

@test "ends_with file.bash ''" {
  run ends_with "file.bash" ""
  assert_success
  assert_output true
}

@test "ends_with 'file bash' 'sh'" {
  run ends_with "file bash" "sh"
  assert_success
  assert_output true
}

@test "ends_with 'file bash' ' bash '" {
  run ends_with "file bash" " bash "
  assert_success
  assert_output false
}

@test "ends_with 'file bash' 'bash '" {
  run ends_with "file bash" "bash "
  assert_success
  assert_output false
}

@test "ends_with 'file bash' ' bash'" {
  run ends_with "file bash" " bash"
  assert_success
  assert_output true
}

@test "ends_with 'file bash' 'file'" {
  run ends_with "file bash" "file"
  assert_success
  assert_output false
}
