#!/usr/bin/env bats

setup_fixture
load_module relative

@test "l.relative '' ''" {
  run l.relative '' ''
  assert_success
  assert_output ''
}

@test "l.relative '' 'dir'" {
  run l.relative '' 'dir'
  assert_success
  assert_output 'dir'
}

@test "l.relative 'a/b/c.txt' 'dir'" {
  run l.relative 'a/b/c.txt' 'dir'
  assert_success
  assert_output '../../../dir'
}

@test "l.relative 'dir' 'a/b/c.txt'" {
  run l.relative 'dir' 'a/b/c.txt'
  assert_success
  assert_output '../a/b/c.txt'
}


@test "l.relative 'a/b/c.txt' 'a/b/g.txt'" {
  run l.relative 'a/b/c.txt' 'a/b/g.txt'
  assert_success
  assert_output 'g.txt'
}

@test "l.relative '/a/b/c/d' '/a/b'" {
  run l.relative '/a/b/c/d' '/a/b'
  assert_success
  assert_output '../..'
}

@test "l.relative 'a' 'a'" {
  run l.relative 'a' 'a'
  assert_success
  assert_output '.'
}

@test "l.relative 'a/b' 'a/c'" {
  run l.relative 'a/b' 'a/c'
  assert_success
  assert_output '../c'
}

@test "l.relative '../a/b' '../a/c'" {
  run l.relative '../a/b' '../a/c'
  assert_success
  assert_output '../c'
}
