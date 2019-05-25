#!/usr/bin/env bats

setup_fixture
load_module ask

@test "ask hello" {
  skip 'how to test it?'
  result=$(ask hello)
}

@test "ask hello world" {
  skip 'how to test it?'
  result=$(ask hello world)
}
