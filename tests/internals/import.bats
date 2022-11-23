#!/usr/bin/env bats

setup_fixture

@test "_lobash.imports without any modules" {
  run _lobash.imports
  assert_success
  assert_output ''
}

@test "_lobash.imports module" {
  _lobash.imports ask
  assert_equal "$(type -t l.ask)" "function"
}

@test "_lobash.imports multi modules" {
  _lobash.imports ask first
  assert_equal "$(type -t l.ask)" "function"
  assert_equal "$(type -t l.first)" "function"
}

@test "_lobash.imports same module twice" {
  _lobash.imports ask
  _lobash.imports ask
  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t l.ask)" "function"
}

@test "_lobash.imports a module which has two Dependents" {
  _lobash.imports has_not.s
  assert_equal "$(type -t l.has.s)" "function"
  assert_equal "$(type -t l.not.s)" "function"
}

@test "_lobash.imports a module which has only one Dependent" {
  _lobash.imports rgb_to_hex
  assert_equal "$(type -t l.rgb_to_hex)" "function"
  assert_equal "$(type -t l.is_number)" "function"
}
