#!/usr/bin/env bats

setup_fixture

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

@test "l.start_with '' ''" {
  run l.start_with "" ""
  assert_success
  assert_output ''
}

@test "l.start_with '' 'abc'" {
  run l.start_with "" "abc"
  assert_failure
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
