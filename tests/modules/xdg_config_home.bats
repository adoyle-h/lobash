#!/usr/bin/env bats

setup_fixture
load_module xdg_config_home

@test "l.xdg_config_home" {
  run l.xdg_config_home
  assert_success
  assert_output "$HOME/.config"
}
