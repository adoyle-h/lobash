#!/usr/bin/env bats

setup_fixture
load_module match

@test "l.match '    hello' '^[[:space:]]*(.*)'" {
  run l.match '    hello' '^[[:space:]]*(.*)'
  assert_success
  assert_output 'hello'
}

@test "l.match '#FFFFFF' '^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$'" {
  run l.match '#FFFFFF' '^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$'
  assert_success
  assert_output '#FFFFFF'
}

@test "l.match 'red' '^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$'" {
  run l.match 'red' '^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$'
  assert_success
  assert_output ''
}

@test "l.match 'hello world' 'hello ([a-z]+)'" {
  run l.match 'hello world' 'hello ([a-z]+)'
  assert_success
  assert_output world
}

@test "l.match 'hello my world' 'hello ([a-z]+) ([a-z]+)'" {
  run l.match 'hello my world' 'hello ([a-z]+) ([a-z]+)'
  assert_success
  assert_output 'my'
}

@test "l.match 'hello my world' 'hello ([a-z]+) ([a-z]+)' 2" {
  run l.match 'hello my world' 'hello ([a-z]+) ([a-z]+)' 2
  assert_success
  assert_output 'world'
}
