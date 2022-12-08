#!/usr/bin/env bats

setup_fixture

@test "l.match_list 'hello world' 'hello ([a-z]+)' list" {
  t() {
    local -a list=()
    l.match_list 'hello world' 'hello ([a-z]+)' list
    echo ${#list[@]}
    echo ${list[0]}
  }
  run t
  assert_success
  assert_line -n 0 1
  assert_line -n 1 world
}

@test "l.match_list 'hello my world' 'hello ([a-z]+) ([a-z]+)' list" {
  t() {
    local -a list=()
    l.match_list 'hello my world' 'hello ([a-z]+) ([a-z]+)' list
    echo ${#list[@]}
    echo ${list[0]}
    echo ${list[1]}
  }
  run t
  assert_success
  assert_line -n 0 2
  assert_line -n 1 my
  assert_line -n 2 world
}

@test "l.match_list '-x -y --config' '-([a-z]+)' list" {
  t() {
    local -a list=()
    l.match_list '-x -y --config' '-([a-z]+)' list
    echo ${#list[@]}
    echo ${list[0]}
  }
  run t
  assert_success
  assert_line -n 0 1
  assert_line -n 1 x
}

@test "l.match_list '-x -y --config' '-([a-z]+) -([a-z]+) --([a-z]+)' list" {
  t() {
    local -a list=()
    l.match_list '-x -y --config' '-([a-z]+) -([a-z]+) --([a-z]+)' list
    echo ${#list[@]}
    echo ${list[0]}
    echo ${list[1]}
    echo ${list[2]}
  }
  run t
  assert_success
  assert_line -n 0 3
  assert_line -n 1 x
  assert_line -n 2 y
  assert_line -n 3 config
}

@test "l.match_list 'abc' '' list" {
  t() {
    local -a list=()
    l.match_list 'abc' '' list
    echo ${#list[@]}
  }
  run t
  assert_success
  assert_line -n 0 0
}

@test "l.match_list 'abc' '([0-9])+' list" {
  t() {
    local -a list=()
    l.match_list 'abc' '([0-9])+' list
    echo ${#list[@]}
  }
  run t
  assert_success
  assert_line -n 0 0
}
