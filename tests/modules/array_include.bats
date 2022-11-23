#!/usr/bin/env bats

setup_fixture
test_prepare array_include
load_module array_include

@test "l.array_include (he ll o world) hello" {
  local arr=(he ll o world)
  run l.array_include arr "hello"
  assert_failure
  assert_output ''
}

@test "l.array_include (he ll o world) ll" {
  local arr=(he ll o world)
  run l.array_include arr "ll"
  assert_success
  assert_output ''
}

@test "l.array_include (he ll o world) ok" {
  local arr=(he ll o world)
  run l.array_include arr "ok"
  assert_failure
  assert_output ''
}

@test "l.array_include ('' ' ') ''" {
  local arr=('' ' ')
  run l.array_include arr ''
  assert_success
  assert_output ''
}

@test "l.array_include ('' ' ') ' '" {
  local arr=('' ' ')
  run l.array_include arr ''
  assert_success
  assert_output ''
}

@test "l.array_include () ' '" {
  local arr=()
  run l.array_include arr ' '
  assert_failure
  assert_output ''
}

@test "l.array_include () ''" {
  local arr=()
  run l.array_include arr ''
  assert_failure
  assert_output ''
}
