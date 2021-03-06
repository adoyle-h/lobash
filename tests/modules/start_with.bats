#!/usr/bin/env bats

setup_fixture
test_prepare start_with
load_module start_with

@test "l.start_with hello o" {
  run l.start_with "hello" "o"
  assert_failure
  assert_output ''
}

@test "l.start_with hello oo" {
  run l.start_with "hello" "oo"
  assert_failure
  assert_output ''
}

@test "l.start_with hello hello" {
  run l.start_with "hello" "hello"
  assert_success
  assert_output ''
}

@test "l.start_with file.bash ''" {
  run l.start_with "file.bash" ""
  assert_success
  assert_output ''
}

@test "l.start_with 'file bash' 'fi'" {
  run l.start_with "file bash" "fi"
  assert_success
  assert_output ''
}

@test "l.start_with file.bash file" {
  run l.start_with "file.bash" "file"
  assert_success
  assert_output ''
}

@test "l.start_with file.bash .file" {
  run l.start_with "file.bash" ".file"
  assert_failure
  assert_output ''
}

@test "l.start_with 'file bash' 'file '" {
  run l.start_with "file bash" "file "
  assert_success
  assert_output ''
}

@test "l.start_with 'file bash' ' file '" {
  run l.start_with "file bash" " file "
  assert_failure
  assert_output ''
}

@test "l.start_with 'file bash' ' file'" {
  run l.start_with "file bash" " file"
  assert_failure
  assert_output ''
}

@test "l.start_with 'file bash' 'file'" {
  run l.start_with "file bash" "file"
  assert_success
  assert_output ''
}
