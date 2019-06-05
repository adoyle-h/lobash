#!/usr/bin/env bats

setup_fixture
load_module split

@test "l.split a,asd,bcd,d ','" {
  run l.split 'a,asd,bcd,d' ','
  assert_success
  assert_line -n 0 'a'
  assert_line -n 1 'asd'
  assert_line -n 2 'bcd'
  assert_line -n 3 'd'
}

@test "l.split 'a asd bcd d' ''" {
  run l.split 'a asd bcd d' ''
  assert_success
  assert_output 'a asd bcd d'
}

@test "l.split 'a asd bcd d' ' '" {
  run l.split 'a asd bcd d' ' '
  assert_success
  assert_line -n 0 'a'
  assert_line -n 1 'asd'
  assert_line -n 2 'bcd'
  assert_line -n 3 'd'
}

@test "l.split 'a asd bcd d'" {
  local expect=$'a\nasd\nbcd\nd'
  run l.split 'a asd bcd d'
  assert_success
  assert_line -n 0 'a'
  assert_line -n 1 'asd'
  assert_line -n 2 'bcd'
  assert_line -n 3 'd'
}
