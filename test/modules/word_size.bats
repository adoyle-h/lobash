#!/usr/bin/env bats

setup_fixture
load_module word_size

@test "word_size (a b c d)" {
  local arr=(a b c d)
  run word_size "${arr[*]}"
	assert_success
	assert_output 4
}

@test "word_size ( '' '  ' 0 )" {
  local arr=( '' '  ' 0 )
  run word_size "${arr[*]}"
	assert_success
	assert_output 1
}

@test "word_size ( '' '  ' 0 ) with IFS=," {
  local arr=( '' '  ' 0 )
  local _IFS="$IFS";
  IFS=','
  local str="${arr[*]}";
  IFS="$_IFS";

  run word_size "${str}" ','
	assert_success
	assert_output 3
}
