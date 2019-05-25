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

@test "import ask module" {
  load_src import
  import ask

  assert_equal "$(type -t ask)" "function"
  assert_equal "$(type -t l.ask)" ""
}

@test "import ask module with prefix 'l.'" {
  load_src import
  import ask l.

  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t l.ask)" "function"
}

@test "import all" {
  load_src import
  import_all

  assert_equal "$(type -t ask)" "function"
  assert_equal "$(type -t l.ask)" ""
}

@test "import all with prefix 'l.'" {
  load_src import
  import_all l.

  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t l.ask)" "function"
}
