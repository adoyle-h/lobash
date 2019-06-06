#!/usr/bin/env bats

setup_fixture
load_module starts_with

@test "l.starts_with hello o" {
  run l.starts_with "hello" "o"
  assert_success
  assert_output false
}

@test "l.starts_with hello oo" {
  run l.starts_with "hello" "oo"
  assert_success
  assert_output false
}

@test "l.starts_with hello hello" {
  run l.starts_with "hello" "hello"
  assert_success
  assert_output true
}

@test "l.starts_with file.bash ''" {
  run l.starts_with "file.bash" ""
  assert_success
  assert_output true
}

@test "l.starts_with 'file bash' 'fi'" {
  run l.starts_with "file bash" "fi"
  assert_success
  assert_output true
}

@test "l.starts_with file.bash file" {
  run l.starts_with "file.bash" "file"
  assert_success
  assert_output true
}

@test "l.starts_with file.bash .file" {
  run l.starts_with "file.bash" ".file"
  assert_success
  assert_output false
}

@test "l.starts_with 'file bash' 'file '" {
  run l.starts_with "file bash" "file "
  assert_success
  assert_output true
}

@test "l.starts_with 'file bash' ' file '" {
  run l.starts_with "file bash" " file "
  assert_success
  assert_output false
}

@test "l.starts_with 'file bash' ' file'" {
  run l.starts_with "file bash" " file"
  assert_success
  assert_output false
}

@test "l.starts_with 'file bash' 'file '" {
  run l.starts_with "file bash" "file "
  assert_success
  assert_output true
}

@test "l.starts_with 'file bash' 'file'" {
  run l.starts_with "file bash" "file"
  assert_success
  assert_output true
}
