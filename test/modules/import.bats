#!/usr/bin/env bats

setup_fixture

@test "import ask module" {
  load_src import
  import ask

  assert_equal "$(type -t ask)" "function"
  assert_equal "$(type -t l.ask)" ""
}

@test "import ask module twice" {
  load_src import
  import ask
  import ask
}

@test "import trim_start module twice" {
  load_src import
  import trim_start
  import trim_start
}

@test "import trim module twice" {
  load_src import
  import trim
  import trim
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
