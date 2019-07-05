#!/usr/bin/env bats

setup_fixture
test_prepare echo_screen
load_module echo_screen

@test "l.echo_screen hello" {
  run l.echo_screen hello
  assert_success
  assert_output ''
}

@test "l.echo_screen hello world" {
  run l.echo_screen hello world
  assert_success
  assert_output ''
}

@test "l.echo_screen 'hello world'" {
  run l.echo_screen 'hello world'
  assert_success
  assert_output ''
}

@test "l.echo_screen hello   world" {
  run l.echo_screen hello   world
  assert_success
  assert_output ''
}

@test "l.echo_screen -- hello world" {
  run l.echo_screen -- hello world
  assert_success
  assert_output ''
}

@test "l.echo_screen -p -- hello world" {
  run l.echo_screen -p -- hello world
  assert_success
  assert_output ''
}

@test "l.echo_screen -n -- hello world" {
  run l.echo_screen -n -- hello world
  assert_success
  assert_output ''
}

@test "l.echo_screen -- -n hello world" {
  run l.echo_screen -- -n hello world
  assert_success
  assert_output ''
}

@test "l.echo_screen ( -n 123 )" {
  local b=( -n 123 )
  run l.echo_screen ${b[@]}
  assert_success
  assert_output ''
}
