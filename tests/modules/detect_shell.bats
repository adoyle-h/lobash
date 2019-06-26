#!/usr/bin/env bats

setup_fixture
load_module detect_shell

@test "l.detect_shell bash" {
  t() {
    BASH_VERSION=true l.detect_shell
  }
  run t
	assert_success
	assert_output Bash
}

@test "l.detect_shell zsh" {
  t() {
    BASH_VERSION= ZSH_VERSION=true l.detect_shell
  }
  run t
	assert_success
	assert_output Zsh
}
