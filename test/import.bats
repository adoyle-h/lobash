#!/usr/bin/env bats

setup_fixture

@test "load import module" {
  load_src import

  assert_equal "$(type -t import)" "function"
  assert_equal "$(type -t import_all)" "function"
}

@test "load import module with prefix l_" {
  load_src import l_

  assert_equal "$(type -t l_import)" "function"
  assert_equal "$(type -t l_import_all)" "function"
}

@test "load import module with prefix l." {
  load_src import l.

  assert_equal "$(type -t l.import)" "function"
  assert_equal "$(type -t l.import_all)" "function"
}

@test "load import module with prefix l-" {
  load_src import l-

  assert_equal "$(type -t l-import)" "function"
  assert_equal "$(type -t l-import_all)" "function"
}

@test "load import module with prefix l#" {
  run load_src import l#
  assert_failure
}

@test "load import module with prefix l" {
  load_src import l
  assert_equal "$(type -t limport)" "function"
  assert_equal "$(type -t limport_all)" "function"
}

@test "load import module with prefix lo" {
  load_src import lo
  assert_equal "$(type -t loimport)" "function"
  assert_equal "$(type -t loimport_all)" "function"
}

@test "load import module with prefix MY" {
  load_src import MY
  assert_equal "$(type -t MYimport)" "function"
  assert_equal "$(type -t MYimport_all)" "function"
}

@test "load import module with prefix M0" {
  load_src import M0
  assert_equal "$(type -t M0import)" "function"
  assert_equal "$(type -t M0import_all)" "function"
}
