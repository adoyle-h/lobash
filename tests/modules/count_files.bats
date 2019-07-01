#!/usr/bin/env bats

setup_fixture
load_module count_files

@test "l.count_files /temp_dir with no file" {
  local temp_dir
  temp_dir=$(mktemp -d)

  run l.count_files "$temp_dir"
  assert_success
  assert_output 0
}

@test "l.count_files /temp_dir/ with no file" {
  local temp_dir
  temp_dir=$(mktemp -d)

  run l.count_files "$temp_dir/"
  assert_success
  assert_output 0
}

@test "l.count_files /temp_dir with two files" {
  local temp_dir
  temp_dir=$(mktemp -d)
  touch "$temp_dir"/a
  touch "$temp_dir"/b

  run l.count_files "$temp_dir"
  assert_success
  assert_output 2

  run l.count_files "$temp_dir/"
  assert_success
  assert_output 2
}


@test "l.count_files /temp_dir/a and /temp_dir/b/" {
  local temp_dir
  temp_dir=$(mktemp -d)
  touch "$temp_dir"/a
  mkdir "$temp_dir"/b

  run l.count_files "$temp_dir"
  assert_success
  assert_output 2

  run l.count_files "$temp_dir/"
  assert_success
  assert_output 2
}

@test "l.count_files /temp_dir/a and /temp_dir/b/c/d/e/" {
  local temp_dir
  temp_dir=$(mktemp -d)
  touch "$temp_dir"/a
  mkdir -p "$temp_dir"/b/c/d/e

  run l.count_files "$temp_dir"
  assert_success
  assert_output 2

  run l.count_files "$temp_dir/"
  assert_success
  assert_output 2
}

@test "l.count_files /temp_dir/a and /temp_dir/b/c and /temp_dir/b/d" {
  local temp_dir
  temp_dir=$(mktemp -d)
  touch "$temp_dir"/a
  mkdir -p "$temp_dir"/b/
  touch "$temp_dir"/b/c
  touch "$temp_dir"/b/d

  run l.count_files "$temp_dir"
  assert_success
  assert_output 2

  run l.count_files "$temp_dir/"
  assert_success
  assert_output 2
}

@test "l.count_files /temp_dir/a and /temp_dir/b and /temp_dir/.c" {
  local temp_dir
  temp_dir=$(mktemp -d)
  touch "$temp_dir"/a
  touch "$temp_dir"/b
  touch "$temp_dir"/.c

  run l.count_files "$temp_dir"
  assert_success
  assert_output 3

  run l.count_files "$temp_dir/"
  assert_success
  assert_output 3
}
