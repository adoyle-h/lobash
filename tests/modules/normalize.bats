#!/usr/bin/env bats

setup_fixture
load_module normalize

@test "l.normalize and l.normalize ''" {
  run l.normalize ''
  assert_success
  assert_output '.'

  run l.normalize
  assert_success
  assert_output '.'
}

@test "l.normalize . and ./" {
  run l.normalize .
  assert_success
  assert_output .

  run l.normalize ./
  assert_success
  assert_output .
}

@test "l.normalize .." {
  run l.normalize ..
  assert_success
  assert_output ..
}

@test "l.normalize ../" {
  run l.normalize ../
  assert_success
  assert_output ..
}

@test "l.normalize ../../" {
  run l.normalize ../../
  assert_success
  assert_output ../..
}

@test "l.normalize /" {
  run l.normalize /
  assert_success
  assert_output /
}

@test "l.normalize /../" {
  run l.normalize /../
  assert_success
  assert_output /
}

@test "l.normalize /a/../../" {
  run l.normalize /a/../../
  assert_success
  assert_output /

  run l.normalize /a/../..
  assert_success
  assert_output /
}

@test "l.normalize /a//b" {
  run l.normalize /a//b
  assert_success
  assert_output /a/b
}

@test "l.normalize /a/b/c" {
  run l.normalize /a/b/c
  assert_success
  assert_output /a/b/c
}

@test "l.normalize /a/b/c/" {
  run l.normalize /a/b/c/
  assert_success
  assert_output /a/b/c
}

@test "l.normalize /a/b/c//" {
  run l.normalize /a/b/c//
  assert_success
  assert_output /a/b/c
}

@test "l.normalize /a/b/c///" {
  run l.normalize /a/b/c///
  assert_success
  assert_output /a/b/c
}

@test "l.normalize /a/b/c/././" {
  run l.normalize /a/b/c/././
  assert_success
  assert_output /a/b/c
}

@test "l.normalize /a/b/c/." {
  run l.normalize /a/b/c/.
  assert_success
  assert_output /a/b/c
}

@test "l.normalize /a/b/c/.." {
  run l.normalize /a/b/c/..
  assert_success
  assert_output /a/b
}

@test "l.normalize /a/b/./c/" {
  run l.normalize /a/b/./c/
  assert_success
  assert_output /a/b/c
}

@test "l.normalize /a/b/c/../d" {
  run l.normalize /a/b/c/../d
  assert_success
  assert_output /a/b/d
}

@test "l.normalize /a/b/c/../d/" {
  run l.normalize /a/b/c/../d/
  assert_success
  assert_output /a/b/d
}

@test "l.normalize /a/../b/../c/" {
  run l.normalize /a/../b/../c/
  assert_success
  assert_output /c
}

@test "l.normalize /a/../b/c/" {
  run l.normalize /a/../b/c/
  assert_success
  assert_output /b/c
}

@test "l.normalize /a/b/../c.bash" {
  run l.normalize /a/b/../c.bash
  assert_success
  assert_output /a/c.bash
}
