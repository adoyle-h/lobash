#!/usr/bin/env bats

setup_fixture

@test "import import module" {
  load_src import

  assert_equal "$(type -t import)" "function"
  assert_equal "$(type -t import_all)" "function"
}

@test "import import module with prefix" {
  load_src import haha_

  assert_equal "$(type -t haha_import)" "function"
  assert_equal "$(type -t haha_import_all)" "function"
}
