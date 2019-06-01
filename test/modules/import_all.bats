#!/usr/bin/env bats

setup_fixture

@test "import_all without prefix" {
  load_module import_all
  import_all

  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t l.ask)" "function"
  assert_equal "$(type -t l.trim)" "function"
}

@test "import_all with prefix 'l.'" {
  load_module import_all
  import_all l.

  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t l.ask)" "function"
}

@test "import_all with prefix 'l_'" {
  load_module import_all
  import_all l_

  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t l_ask)" "function"
}

@test "import_all with prefix 'l-'" {
  load_module import_all
  import_all l-

  assert_equal "$(type -t ask)" ""
  assert_equal "$(type -t l-ask)" "function"
}

@test "import_all with prefix 'l#'" {
  load_module import_all
  run import_all l#
  assert_failure
  assert_output "[error:lobash] Not found module 'l#'."
}

@test "import_all l" {
  load_module import_all
  run import_all l
  assert_failure
  assert_output "[error:lobash] Not found module 'l'."
}
