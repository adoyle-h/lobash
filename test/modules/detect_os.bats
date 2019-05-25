#!/usr/bin/env bats

setup_fixture
load_module detect_os

@test "detect_os" {
  skip "how to test it?"
  result="$(detect_os)"
  assert_equal "$result" "MacOS"
}
