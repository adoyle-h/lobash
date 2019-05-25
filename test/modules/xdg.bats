#!/usr/bin/env bats

setup_fixture
load_module xdg

@test "get_xdg_config_home" {
  result="$(get_xdg_config_home)"
  assert_equal "$result" "$HOME/.config"
}
