#!/usr/bin/env bats

setup_fixture

@test "import_by_category String" {
  skip "not implement"
  load_module import_by_category
  import_by_category String

  assert_equal "$(type -t split)" "function"
  assert_equal "$(type -t str_size)" "function"
}

