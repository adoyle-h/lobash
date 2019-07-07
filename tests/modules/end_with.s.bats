#!/usr/bin/env bats

setup_fixture
test_prepare end_with.s
load_module end_with.s

@test "l.end_with.s hello o" {
  run l.end_with.s "hello" "o"
  assert_success
  assert_output true
}

@test "l.end_with.s hello oo" {
  run l.end_with.s "hello" "oo"
  assert_success
  assert_output false
}

@test "l.end_with.s hello hello" {
  run l.end_with.s "hello" "hello"
  assert_success
  assert_output true
}

@test "l.end_with.s file.bash .bash" {
  run l.end_with.s "file.bash" ".bash"
  assert_success
  assert_output true
}

@test "l.end_with.s file.bash ''" {
  run l.end_with.s "file.bash" ""
  assert_success
  assert_output true
}

@test "l.end_with.s 'file bash' 'sh'" {
  run l.end_with.s "file bash" "sh"
  assert_success
  assert_output true
}

@test "l.end_with.s 'file bash' ' bash '" {
  run l.end_with.s "file bash" " bash "
  assert_success
  assert_output false
}

@test "l.end_with.s 'file bash' 'bash '" {
  run l.end_with.s "file bash" "bash "
  assert_success
  assert_output false
}

@test "l.end_with.s 'file bash' ' bash'" {
  run l.end_with.s "file bash" " bash"
  assert_success
  assert_output true
}

@test "l.end_with.s 'file bash' 'file'" {
  run l.end_with.s "file bash" "file"
  assert_success
  assert_output false
}

@test "l.end_with.s 'file bash ' 'bash '" {
  run l.end_with.s "file bash " " bash "
  assert_success
  assert_output true
}
