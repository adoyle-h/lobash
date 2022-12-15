#!/usr/bin/env bats

setup_fixture

@test "l.count_files /temp_dir with no file" {
  local temp_dir="$BATS_TEST_TMPDIR/empty_dir"
  mkdir "$temp_dir"

  run l.count_files "$temp_dir"
  assert_success
  assert_output 0
}

@test "l.count_files /temp_dir/ with no file" {
  local temp_dir="$BATS_TEST_TMPDIR/empty_dir2"
  mkdir "$temp_dir"

  run l.count_files "$temp_dir/"
  assert_success
  assert_output 0
}

@test "l.count_files /temp_dir with two files" {
  local temp_dir="$BATS_TEST_TMPDIR/dir"
  mkdir "$temp_dir"
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
  local temp_dir="$BATS_TEST_TMPDIR/dir2"
  mkdir "$temp_dir"
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
  local temp_dir="$BATS_TEST_TMPDIR/dir3"
  mkdir -p "$temp_dir"/b/c/d/e
  touch "$temp_dir"/a

  run l.count_files "$temp_dir"
  assert_success
  assert_output 2

  run l.count_files "$temp_dir/"
  assert_success
  assert_output 2
}

@test "l.count_files /temp_dir/a and /temp_dir/b/c and /temp_dir/b/d" {
  local temp_dir="$BATS_TEST_TMPDIR/dir4"
  mkdir -p "$temp_dir"/b
  touch "$temp_dir"/a
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
  local temp_dir="$BATS_TEST_TMPDIR/dir5"
  mkdir "$temp_dir"
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

@test "l.count_files 'temp_dir/a b'" {
  local temp_dir="$BATS_TEST_TMPDIR/dir6"
  mkdir "$temp_dir"
  touch "$temp_dir/a b"

  run l.count_files "$temp_dir"
  assert_success
  assert_output 1

  run l.count_files "$temp_dir/"
  assert_success
  assert_output 1
}
