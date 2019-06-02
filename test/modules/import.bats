#!/usr/bin/env bats

setup_fixture

@test "import without any modules" {
  load_module import
  run import
  assert_failure
  assert_output '[ERROR:LOBASH] Not found any parameters passed to import function.'
}

@test "import module without prefix" {
  load_module import
  import ask
  assert_equal "$(type -t l.ask)" "function"
}

@test "import multi modules without prefix" {
  load_module import
  import ask first
  assert_equal "$(type -t l.ask)" "function"
  assert_equal "$(type -t l.first)" "function"
}

@test "import multi modules with prefix 'l.'" {
  load_module import
  import ask first l.

  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t first)" ""
  assert_equal "$(type -t l.ask)" "function"
  assert_equal "$(type -t l.first)" "function"
}

@test "import module with prefix 'l.'" {
  load_module import
  import ask l.

  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t l.ask)" "function"
}

@test "import module with prefix 'l_'" {
  load_module import
  import ask l_

  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t l.ask)" "function"
  assert_equal "$(type -t l_ask)" "function"
}

@test "import module with prefix 'l-'" {
  load_module import
  import ask l-

  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t l.ask)" "function"
  assert_equal "$(type -t l-ask)" "function"
}

@test "import module with prefix 'l#'" {
  load_module import
  run import ask l#
  assert_failure
  assert_output "[ERROR:LOBASH] Not found module 'l#'."
}

@test "import ask l" {
  load_module import
  run import ask l
  assert_failure
  assert_output "[ERROR:LOBASH] Not found module 'l'."
}

@test "import same module twice" {
  load_module import
  import ask l.
  import ask l.
  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t l.ask)" "function"
}

@test "import same module twice with different prefix names" {
  load_module import
  import ask l.
  import ask k.
  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t l.ask)" "function"
  assert_equal "$(type -t k.ask)" "function"
}
