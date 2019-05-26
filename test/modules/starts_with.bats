#!/usr/bin/env bats

setup_fixture
load_module starts_with

@test "starts_with hello o" {
  run starts_with "hello" "o"
  assert_success
  assert_output false
}

@test "starts_with hello oo" {
  run starts_with "hello" "oo"
  assert_success
  assert_output false
}

@test "starts_with hello hello" {
  run starts_with "hello" "hello"
  assert_success
  assert_output true
}

@test "starts_with file.bash file" {
  run starts_with "file.bash" "file"
  assert_success
  assert_output true
}

@test "starts_with file.bash .file" {
  run starts_with "file.bash" ".file"
  assert_success
  assert_output false
}

@test "starts_with file.bash ''" {
  run starts_with "file.bash" ""
  assert_success
  assert_output true
}

@test "starts_with 'file bash' 'fi'" {
  run starts_with "file bash" "fi"
  assert_success
  assert_output true
}

@test "starts_with 'file bash' ' file '" {
  run starts_with "file bash" " file "
  assert_success
  assert_output false
}

@test "starts_with 'file bash' ' file'" {
  run starts_with "file bash" " file"
  assert_success
  assert_output false
}

@test "starts_with 'file bash' 'file '" {
  run starts_with "file bash" "file "
  assert_success
  assert_output true
}

@test "starts_with 'file bash' 'file'" {
  run starts_with "file bash" "file"
  assert_success
  assert_output true
}
