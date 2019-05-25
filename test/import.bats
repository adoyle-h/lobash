#!/usr/bin/env bats

setup_fixture

@test "export all" {
  load_src import
  import_all
  assert_equal "$(type -t ask)" "function"
}
