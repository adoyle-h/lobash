#!/usr/bin/env bats

setup_fixture
test_prepare array_include.s
load_module array_include.s

@test "l.array_include.s (he ll o world) hello" {
  local arr=(he ll o world)
  run l.array_include.s arr "hello"
  assert_success
  assert_output false
}

@test "l.array_include.s (he ll o world) ll" {
  local arr=(he ll o world)
  run l.array_include.s arr "ll"
  assert_success
  assert_output true
}

@test "l.array_include.s (he ll o world) ok" {
  local arr=(he ll o world)
  run l.array_include.s arr "ok"
  assert_success
  assert_output false
}

@test "l.array_include.s ('' ' ') ''" {
  local arr=('' ' ')
  run l.array_include.s arr ''
  assert_success
  assert_output true
}

@test "l.array_include.s ('' ' ') ' '" {
  local arr=('' ' ')
  run l.array_include.s arr ''
  assert_success
  assert_output true
}

@test "l.array_include.s () ' '" {
  local arr=()
  run l.array_include.s arr ' '
  assert_success
  assert_output false
}

@test "l.array_include.s () ''" {
  local arr=()
  run l.array_include.s arr ''
  assert_success
  assert_output false
}
