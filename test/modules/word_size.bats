#!/usr/bin/env bats

setup_fixture
load_module word_size

@test "l.word_size (a b c d)" {
  local arr=(a b c d)
  run l.word_size "${arr[*]}"
	assert_success
	assert_output 4
}

@test "l.word_size ( '' '  ' 0 )" {
  local arr=( '' '  ' 0 )
  run l.word_size "${arr[*]}"
	assert_success
	assert_output 1
}

@test "l.word_size ( '' '  ' 0 ) with IFS=," {
  local arr=( '' '  ' 0 )
  local _IFS="$IFS";
  IFS=','
  local str="${arr[*]}";
  IFS="$_IFS";

  run l.word_size "${str}" ','
	assert_success
	assert_output 3
}
