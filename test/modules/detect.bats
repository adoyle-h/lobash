#!/usr/bin/env bats

setup_fixture
load_module detect

@test "detect_os" {
  result="$(detect_os)"
  assert_equal "$result" "MacOS"
}
