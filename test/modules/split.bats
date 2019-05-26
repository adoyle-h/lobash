#!/usr/bin/env bats

setup_fixture
load_module split

@test "split a,asd,bcd,d ','" {
  local expect=$'a\nasd\nbcd\nd'
  run split 'a,asd,bcd,d' ','
  assert_success
  assert_output "$expect"
}

@test "split 'a asd bcd d' ''" {
  run split 'a asd bcd d' ''
  assert_success
  assert_output 'a asd bcd d'
}

@test "split 'a asd bcd d' ' '" {
  local expect=$'a\nasd\nbcd\nd'
  run split 'a asd bcd d' ' '
  assert_success
  assert_output "$expect"
}
