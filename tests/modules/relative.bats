#!/usr/bin/env bats

setup_fixture
test_prepare relative
load_module relative

@test "l.relative '' ''" {
  run l.relative '' ''
  assert_success
  assert_output ''
}

@test "l.relative '' '.'" {
  run l.relative '' '.'
  assert_success
  assert_output ''
}

@test "l.relative '.' '.'" {
  run l.relative '.' '.'
  assert_success
  assert_output ''
}

@test "l.relative '.' ''" {
  run l.relative '.' ''
  assert_success
  assert_output ''
}

@test "l.relative '/' '/'" {
  run l.relative '/' '/'
  assert_success
  assert_output ''
}

@test "l.relative '/' '/a/b/c'" {
  run l.relative '/' '/a/b/c'
  assert_success
  assert_output 'a/b/c'
}

@test "l.relative '/a/b/d' '/a/b/c'" {
  run l.relative '/a/b/d' '/a/b/c'
  assert_success
  assert_output '../c'
}

@test "l.relative '/a/d' '/a/b/c'" {
  run l.relative '/a/d' '/a/b/c'
  assert_success
  assert_output '../b/c'
}

@test "l.relative 'abc' ''" {
  run l.relative 'abc' ''
  assert_success
  assert_output '..'
}

@test "l.relative 'a/b/c' ''" {
  run l.relative 'a/b/c' ''
  assert_success
  assert_output '../../..'
}

@test "l.relative '' 'abc'" {
  run l.relative '' 'abc'
  assert_success
  assert_output 'abc'
}

@test "l.relative '/a' '/a/b/c/'" {
  run l.relative '/a' '/a/b/c/'
  assert_success
  assert_output 'b/c'
}

@test "l.relative '/a/b/c/' '/a'" {
  run l.relative '/a/b/c/' '/a'
  assert_success
  assert_output '../..'
}

@test "l.relative '/a/d/e/' '/b/c'" {
  run l.relative '/a/d/e/' '/b/c'
  assert_success
  assert_output '../../../b/c'
}

@test "l.relative '/a/d/e' '/b/c/'" {
  run l.relative '/a/d/e' '/b/c/'
  assert_success
  assert_output '../../../b/c'
}

@test "l.relative './a/d/e/' './b/c'" {
  run l.relative './a/d/e/' './b/c'
  assert_success
  assert_output '../../../b/c'

  run l.relative './a/d/e' './b/c'
  assert_success
  assert_output '../../../b/c'
}

@test "l.relative './a/../e/' './b/c'" {
  run l.relative './a/../e/' './b/c'
  assert_success
  assert_output '../b/c'
}

@test "l.relative './a/./e/' './b/c'" {
  run l.relative './a/./e/' './b/c'
  assert_success
  assert_output '../../b/c'
}

@test "l.relative './a/d/e/' './b/../c'" {
  run l.relative './a/d/e/' './b/../c'
  assert_success
  assert_output '../../../c'
}
