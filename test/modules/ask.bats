#!/usr/bin/env bats

setup_fixture
load_module ask

@test "l.ask hello. Enter y" {
  local r
  r=$(echo y | l.ask hello)
  assert_equal "$r" 'YES'
}

@test "l.ask hello. Enter yes" {
  local r
  r=$(echo yes | l.ask hello)
  assert_equal "$r" 'YES'
}

@test "l.ask hello. Enter Yes" {
  local r
  r=$(echo Yes | l.ask hello)
  assert_equal "$r" 'YES'
}

@test "l.ask hello. Enter YES" {
  local r
  r=$(echo YES | l.ask hello)
  assert_equal "$r" 'YES'
}

@test "l.ask hello. Enter n" {
  local r
  r=$(echo n | l.ask hello)
  assert_equal "$r" 'NO'
}

@test "l.ask hello. Enter no" {
  local r
  r=$(echo no | l.ask hello)
  assert_equal "$r" 'NO'
}

@test "l.ask hello. Enter No" {
  local r
  r=$(echo No | l.ask hello)
  assert_equal "$r" 'NO'
}

@test "l.ask hello. Enter NO" {
  # skip 'how to test it?'
  local r
  r=$(echo NO | l.ask hello)
  assert_equal "$r" 'NO'
}

@test "l.ask hello world" {
  local r
  r=$(echo y | l.ask hello world)
  assert_equal "$r" 'YES'
}
