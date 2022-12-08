#!/usr/bin/env bats

setup_fixture

@test "l.echo hello" {
  run l.echo hello
  assert_success
  assert_output hello
}

@test "l.echo hello world" {
  run l.echo hello world
  assert_success
  assert_output 'hello world'
}

@test "l.echo 'hello world'" {
  run l.echo 'hello world'
  assert_success
  assert_output 'hello world'
}

@test "l.echo hello   world" {
  run l.echo hello   world
  assert_success
  assert_output 'hello world'
}

@test "l.echo -- hello world" {
  run l.echo -- hello world
  assert_success
  assert_output '-- hello world'
}

@test "l.echo -p -- hello world" {
  run l.echo -p -- hello world
  assert_success
  assert_output '-p -- hello world'
}

@test "l.echo -n -- hello world" {
  run l.echo -n -- hello world
  assert_success
  assert_output '-n -- hello world'
}

@test "l.echo -- -n hello world" {
  run l.echo -- -n hello world
  assert_success
  assert_output '-- -n hello world'
}

@test "l.echo ( -n 123 )" {
  local b=( -n 123 )
  run l.echo ${b[@]}
  assert_success
  assert_output '-n 123'
}
