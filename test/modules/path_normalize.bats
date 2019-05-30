#!/usr/bin/env bats

setup_fixture
load_module path_normalize

@test "l.path_normalize /a/b/c" {
  run l.path_normalize /a/b/c
  assert_success
  assert_output /a/b/c
}

@test "l.path_normalize /a/b/c/" {
  run l.path_normalize /a/b/c/
  assert_success
  assert_output /a/b/c
}

@test "l.path_normalize /a/b/c" {
  run l.path_normalize /a/b/c
  assert_success
  assert_output /a/b/c
}

@test "l.path_normalize /a/b/c//" {
  run l.path_normalize /a/b/c//
  assert_success
  assert_output /a/b/c
}

@test "l.path_normalize /a/b/c///" {
  run l.path_normalize /a/b/c///
  assert_success
  assert_output /a/b/c
}

@test "l.path_normalize /a/b/c/././" {
  run l.path_normalize /a/b/c/././
  assert_success
  assert_output /a/b/c
}

@test "l.path_normalize /a/b/c/." {
  run l.path_normalize /a/b/c/.
  assert_success
  assert_output /a/b/c
}

@test "l.path_normalize /a/b/./c/" {
  run l.path_normalize /a/b/./c/
  assert_success
  assert_output /a/b/c
}

@test "l.path_normalize /a/b/./c" {
  run l.path_normalize /a/b/./c
  assert_success
  assert_output /a/b/c
}

@test "l.path_normalize /a/b/c/../d" {
  run l.path_normalize /a/b/c/../d
  assert_success
  assert_output /a/b/d
}

@test "l.path_normalize /a/b/c/../d/" {
  run l.path_normalize /a/b/c/../d/
  assert_success
  assert_output /a/b/d
}
