#!/usr/bin/env bats

setup_fixture
load_module join

@test "join '' (a b c d)" {
  local arr=(a b c d)
  run join '' "${arr[@]}"
	assert_success
	assert_output 'abcd'
}

@test "join (a b c d)" {
  local arr=(a b c d)
  run join ' ' "${arr[@]}"
	assert_success
	assert_output 'a b c d'
}

@test "join , a b c d" {
  local arr=(a b c d)
  run join , "${arr[@]}"
	assert_success
	assert_output 'a,b,c,d'
}

@test "join , a b c d " {
  local arr=(a b c d)
  run join , "${arr[@]}"
	assert_success
	assert_output 'a,b,c,d'
}
