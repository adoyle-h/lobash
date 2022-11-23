#!/usr/bin/env bats

setup_fixture
test_prepare trim_start
load_module trim_start

@test "l.trim_start" {
  run l.trim_start
  assert_success
  assert_output ''
}

@test "l.trim_start ''" {
  run l.trim_start ''
  assert_success
  assert_output ''
}

@test "l.trim_start '  n'" {
  run l.trim_start '  n'
  assert_success
  assert_output "n"
}

@test "l.trim_start 'xxx'" {
  run l.trim_start 'xxx'
  assert_success
  assert_output "xxx"
}

@test "l.trim_start 'ok   '" {
  run l.trim_start 'ok   '
  assert_success
  assert_output 'ok   '
}

@test "l.trim_start '   abc   '" {
  run l.trim_start '   abc   '
  assert_success
  assert_output "abc   "
}

@test "l.trim_start 'prefix.file' 'prefix.'" {
  run l.trim_start 'prefix.file' 'prefix.'
  assert_success
  assert_output "file"
}

@test "l.trim_start 'prefix.file  ' 'prefix.'" {
  run l.trim_start 'prefix.file  ' 'prefix.'
  assert_success
  assert_output "file  "
}

@test "l.trim_start 'prefix.file' ' prefix.'" {
  run l.trim_start 'prefix.file' ' prefix.'
  assert_success
  assert_output "prefix.file"
}

@test "l.trim_start ' prefix.file' ' prefix.'" {
  run l.trim_start ' prefix.file' ' prefix.'
  assert_success
  assert_output "file"
}

@test "l.trim_start ' prefix. file ' ' prefix.'" {
  run l.trim_start ' prefix. file ' ' prefix.'
  assert_success
  assert_output " file "
}

@test "l.trim_start ' pre fix. file ' ' pre fix.'" {
  run l.trim_start ' pre fix. file ' ' pre fix.'
  assert_success
  assert_output " file "
}
