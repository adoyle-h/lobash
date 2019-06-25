#!/usr/bin/env bats

setup_fixture
load_module array_include

@test "l.array_include (he ll o world) hello" {
	local arr=(he ll o world)
  run l.array_include arr "hello"
	assert_success
	assert_output false
}

@test "l.array_include (he ll o world) ll" {
	local arr=(he ll o world)
  run l.array_include arr "ll"
	assert_success
	assert_output true
}

@test "l.array_include (he ll o world) ok" {
	local arr=(he ll o world)
  run l.array_include arr "ok"
	assert_success
	assert_output false
}

@test "l.array_include ('' ' ') ''" {
	local arr=('' ' ')
  run l.array_include arr ''
	assert_success
	assert_output true
}

@test "l.array_include ('' ' ') ' '" {
	local arr=('' ' ')
  run l.array_include arr ''
	assert_success
	assert_output true
}

@test "l.array_include () ' '" {
	local arr=()
  run l.array_include arr ' '
	assert_success
	assert_output false
}

@test "l.array_include () ''" {
	local arr=()
  run l.array_include arr ''
	assert_success
	assert_output false
}
