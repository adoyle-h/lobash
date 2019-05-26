#!/usr/bin/env bats

setup_fixture
load_module xdg

@test "get_xdg_config_home" {
  run get_xdg_config_home
  assert_success
  assert_output "$HOME/.config"
}
