#!/usr/bin/env bats

setup_fixture
load_module xdg

@test "l.get_xdg_config_home" {
  run l.get_xdg_config_home
  assert_success
  assert_output "$HOME/.config"
}
