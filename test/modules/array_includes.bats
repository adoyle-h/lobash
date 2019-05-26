#!/usr/bin/env bats

setup_fixture
load_module array_includes

@test "array_includes hello (he ll o world)" {
	local arr=(he ll o world)
  run array_includes "hello" "${arr[@]}"
	assert_success
	assert_output false
}

@test "array_includes ll (he ll o world)" {
	local arr=(he ll o world)
  run array_includes "ll" "${arr[@]}"
	assert_success
	assert_output true
}

@test "array_includes ok (he ll o world)" {
	local arr=(he ll o world)
  run array_includes "ok" "${arr[@]}"
	assert_success
	assert_output false
}
