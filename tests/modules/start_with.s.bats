#!/usr/bin/env bats

setup_fixture
test_prepare start_with.s
load_module start_with.s

@test "l.start_with.s hello o" {
  run l.start_with.s "hello" "o"
  assert_success
  assert_output false
}

@test "l.start_with.s hello oo" {
  run l.start_with.s "hello" "oo"
  assert_success
  assert_output false
}

@test "l.start_with.s hello hello" {
  run l.start_with.s "hello" "hello"
  assert_success
  assert_output true
}

@test "l.start_with.s file.bash ''" {
  run l.start_with.s "file.bash" ""
  assert_success
  assert_output true
}

@test "l.start_with.s 'file bash' 'fi'" {
  run l.start_with.s "file bash" "fi"
  assert_success
  assert_output true
}

@test "l.start_with.s file.bash file" {
  run l.start_with.s "file.bash" "file"
  assert_success
  assert_output true
}

@test "l.start_with.s file.bash .file" {
  run l.start_with.s "file.bash" ".file"
  assert_success
  assert_output false
}

@test "l.start_with.s 'file bash' 'file '" {
  run l.start_with.s "file bash" "file "
  assert_success
  assert_output true
}

@test "l.start_with.s 'file bash' ' file '" {
  run l.start_with.s "file bash" " file "
  assert_success
  assert_output false
}

@test "l.start_with.s 'file bash' ' file'" {
  run l.start_with.s "file bash" " file"
  assert_success
  assert_output false
}

@test "l.start_with.s 'file bash' 'file'" {
  run l.start_with.s "file bash" "file"
  assert_success
  assert_output true
}
