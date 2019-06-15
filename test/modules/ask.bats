#!/usr/bin/env bats

setup_fixture
load_module ask

# It uses echo pipe just for test.
# You should invoke `l.ask <message>` for normal usage.

@test "echo y | l.ask hello" {
  local r
  r=$(echo y | l.ask hello)
  assert_equal "$r" 'YES'
}

@test "echo yes | l.ask hello" {
  local r
  r=$(echo yes | l.ask hello)
  assert_equal "$r" 'YES'
}

@test "echo Yes | l.ask hello" {
  local r
  r=$(echo Yes | l.ask hello)
  assert_equal "$r" 'YES'
}

@test "echo YES | l.ask hello" {
  local r
  r=$(echo YES | l.ask hello)
  assert_equal "$r" 'YES'
}

@test "echo n | l.ask hello" {
  local r
  r=$(echo n | l.ask hello)
  assert_equal "$r" 'NO'
}

@test "echo no | l.ask hello" {
  local r
  r=$(echo no | l.ask hello)
  assert_equal "$r" 'NO'
}

@test "echo No | l.ask hello" {
  local r
  r=$(echo No | l.ask hello)
  assert_equal "$r" 'NO'
}

@test "echo NO | l.ask hello" {
  # skip 'how to test it?'
  local r
  r=$(echo NO | l.ask hello)
  assert_equal "$r" 'NO'
}

@test "echo y | l.ask 'hello world'" {
  local r
  r=$(echo y | l.ask 'hello world')
  assert_equal "$r" 'YES'
}

@test "echo '' | l.ask 'hello world' N" {
  local r
  r=$(echo '' | l.ask 'hello world' N)
  assert_equal "$r" 'NO'
}

@test "echo '' | l.ask 'hello world' Y" {
  local r
  r=$(echo '' | l.ask 'hello world' Y)
  assert_equal "$r" 'YES'
}
