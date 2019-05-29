#!/usr/bin/env bats

setup_fixture
load_module get_matched

@test "get_matched 'hello' 'hello world'" {
  run get_matched 'hello' 'hello world'
  assert_failure
  assert_output "sed: -e expression #1, char 11: invalid reference \\1 on \`s' command's RHS"
}

@test "get_matched 'hello' 2 'hello world'" {
  run get_matched 'hello' 2 'hello world'
  assert_failure
  assert_output "sed: -e expression #1, char 11: invalid reference \\2 on \`s' command's RHS"
}

@test "get_matched 'hello (\w+)' 'hello world'" {
  run get_matched 'hello (\w+)' 'hello world'
  assert_success
  assert_output world
}

@test "get_matched 'hello (\w+)' 1 'hello world'" {
  run get_matched 'hello (\w+)' 1 'hello world'
  assert_success
  assert_output world
}

@test "get_matched 'hello (\w+)' 2 'hello world'" {
  run get_matched 'hello (\w+)' 2 'hello world'
  assert_failure
  assert_output "sed: -e expression #1, char 17: invalid reference \\2 on \`s' command's RHS"
}

@test "get_matched 'hello (\w+) (\w+)' 1 'hello my world'" {
  run get_matched 'hello (\w+) (\w+)' 1 'hello my world'
  assert_success
  assert_output my
}

@test "get_matched 'hello (\w+) (\w+)' 2 'hello my world'" {
  run get_matched 'hello (\w+) (\w+)' 2 'hello my world'
  assert_success
  assert_output world
}
