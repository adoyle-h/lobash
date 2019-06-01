#!/usr/bin/env bats

setup_fixture
load_module count_files

@test "l.count_files /temp_dir/* with no file" {
  local temp_dir
  temp_dir=$(mktemp -d)
  echo $temp_dir
  run l.count_files "$temp_dir"/*
  assert_success
  assert_output 0
}

@test "l.count_files /temp_dir/* with two files" {
  local temp_dir
  temp_dir=$(mktemp -d)
  touch "$temp_dir"/a
  touch "$temp_dir"/b

  run l.count_files "$temp_dir"/*
  assert_success
  assert_output 2
}
