#!/usr/bin/env bats

setup_fixture
test_prepare end_with
load_module end_with

@test "l.end_with hello o" {
  run l.end_with "hello" "o"
  assert_success
  assert_output ''
}

@test "l.end_with hello oo" {
  run l.end_with "hello" "oo"
  assert_failure
  assert_output ''
}

@test "l.end_with hello hello" {
  run l.end_with "hello" "hello"
  assert_success
  assert_output ''
}

@test "l.end_with file.bash .bash" {
  run l.end_with "file.bash" ".bash"
  assert_success
  assert_output ''
}

@test "l.end_with file.bash ''" {
  run l.end_with "file.bash" ""
  assert_success
  assert_output ''
}

@test "l.end_with '' ''" {
  run l.end_with "" ""
  assert_success
  assert_output ''
}

@test "l.end_with '' 'abc'" {
  run l.end_with "" "abc"
  assert_failure
  assert_output ''
}

@test "l.end_with 'file bash' 'sh'" {
  run l.end_with "file bash" "sh"
  assert_success
  assert_output ''
}

@test "l.end_with 'file bash' ' bash '" {
  run l.end_with "file bash" " bash "
  assert_failure
  assert_output ''
}

@test "l.end_with 'file bash' 'bash '" {
  run l.end_with "file bash" "bash "
  assert_failure
  assert_output ''
}

@test "l.end_with 'file bash' ' bash'" {
  run l.end_with "file bash" " bash"
  assert_success
  assert_output ''
}

@test "l.end_with 'file bash' 'file'" {
  run l.end_with "file bash" "file"
  assert_failure
  assert_output ''
}

@test "l.end_with 'file bash ' 'bash '" {
  run l.end_with "file bash " " bash "
  assert_success
  assert_output ''
}
