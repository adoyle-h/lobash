#!/usr/bin/env bats

setup_fixture
load_module ask

@test "l.ask hello" {
  skip 'how to test it?'
  result=$(l.ask hello)
}

@test "l.ask hello world" {
  skip 'how to test it?'
  result=$(l.ask hello world)
}
