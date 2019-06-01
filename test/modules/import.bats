#!/usr/bin/env bats

setup_fixture

@test "import without any modules" {
  load_module import
  run import
  assert_failure 'Not found any parameters passed to import function.'
}

@test "import ask module" {
  load_module import
  run import ask
  assert_failure 'Missing prefix parameter.'
}

@test "import multi modules" {
  load_module import
  run import ask first
  assert_failure 'Missing prefix parameter.'
}

@test "import multi modules with prefix 'l.'" {
  load_module import
  import ask first l.

  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t first)" ""
  assert_equal "$(type -t l.ask)" "function"
  assert_equal "$(type -t l.first)" "function"
}

@test "import ask module with prefix 'l.'" {
  load_module import
  import ask l.

  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t l.ask)" "function"
}

@test "import ask module with prefix 'l_'" {
  load_module import
  import ask l_

  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t l.ask)" "function"
  assert_equal "$(type -t l_ask)" "function"
}

@test "import ask module with prefix 'l-'" {
  load_module import
  import ask l-

  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t l.ask)" "function"
  assert_equal "$(type -t l-ask)" "function"
}

@test "import ask module twice" {
  load_module import
  import ask l.
  import ask l.
}

@test "import ask module twice with different prefix names" {
  load_module import
  import ask l.
  import ask k.
}
