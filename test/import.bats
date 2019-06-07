#!/usr/bin/env bats

setup_fixture

@test "load import module" {
  load_src import

  assert_equal "$(type -t import)" "function"
  assert_equal "$(type -t import_all)" "function"
  assert_equal "$(type -t import_category)" "function"
}

@test "load import module with prefix l_" {
  load_src import l_

  assert_equal "$(type -t l_import)" "function"
  assert_equal "$(type -t l_import_all)" "function"
  assert_equal "$(type -t l_import_category)" "function"
}

@test "load import module with prefix l." {
  load_src import l.

  assert_equal "$(type -t l.import)" "function"
  assert_equal "$(type -t l.import_all)" "function"
  assert_equal "$(type -t l.import_category)" "function"
}

@test "load import module with prefix l-" {
  load_src import l-

  assert_equal "$(type -t l-import)" "function"
  assert_equal "$(type -t l-import_all)" "function"
  assert_equal "$(type -t l-import_category)" "function"
}

@test "load import module with prefix l#" {
  run load_src import l#
  assert_failure 3
  assert_output 'The import prefix must end with letter which matches [-._a-zA-Z0-9]'
}

@test "load import module with prefix l" {
  load_src import l
  assert_equal "$(type -t limport)" "function"
  assert_equal "$(type -t limport_all)" "function"
  assert_equal "$(type -t limport_category)" "function"
}

@test "load import module with prefix MY" {
  load_src import MY
  assert_equal "$(type -t MYimport)" "function"
  assert_equal "$(type -t MYimport_all)" "function"
  assert_equal "$(type -t MYimport_category)" "function"
}

@test "load import module with prefix M0" {
  load_src import M0
  assert_equal "$(type -t M0import)" "function"
  assert_equal "$(type -t M0import_all)" "function"
  assert_equal "$(type -t M0import_category)" "function"
}
