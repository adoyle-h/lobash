#!/usr/bin/env bats

setup_fixture
load_module array_include

@test "l.array_include hello (he ll o world)" {
	local arr=(he ll o world)
  run l.array_include "hello" "${arr[@]}"
	assert_success
	assert_output false
}

@test "l.array_include ll (he ll o world)" {
	local arr=(he ll o world)
  run l.array_include "ll" "${arr[@]}"
	assert_success
	assert_output true
}

@test "l.array_include ok (he ll o world)" {
	local arr=(he ll o world)
  run l.array_include "ok" "${arr[@]}"
	assert_success
	assert_output false
}
