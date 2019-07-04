#!/usr/bin/env bats

setup_fixture
load_module ask_input

# It uses echo pipe just for test.
# You should invoke `l.ask_input <message>` for normal usage.

@test "echo y | l.ask_input hello" {
  t() {
    echo y | l.ask_input hello
  }
  run t
  assert_success
  assert_output 'y'
}

@test "echo '' | l.ask_input 'hello'" {
  t() {
    echo '' | l.ask_input hello
  }
  run t
  assert_success
  assert_output ''
}
