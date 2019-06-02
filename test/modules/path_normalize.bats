#!/usr/bin/env bats

setup_fixture
load_module path_normalize

@test "l.path_normalize and l.path_normalize ''" {
  run l.path_normalize ''
  assert_failure 2
  assert_output 'Input path cannot be empty string'

  run l.path_normalize
  assert_failure 2
  assert_output 'Input path cannot be empty string'
}

@test "l.path_normalize ./ and ../" {
  run l.path_normalize ./
  assert_failure 3
  assert_output 'Input path cannot starts with .'

  run l.path_normalize ../
  assert_failure 3
  assert_output 'Input path cannot starts with .'
}

@test "l.path_normalize /" {
  run l.path_normalize /
  assert_success
  assert_output /
}

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

@test "l.path_normalize /a/../b/../c/" {
  run l.path_normalize /a/../b/../c/
  assert_success
  assert_output /c
}

@test "l.path_normalize /a/../b/c/" {
  run l.path_normalize /a/../b/c/
  assert_success
  assert_output /b/c
}

@test "l.path_normalize /a/b/../c.bash" {
  run l.path_normalize /a/b/../c.bash
  assert_success
  assert_output /a/c.bash
}
