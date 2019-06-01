#!/usr/bin/env bats

setup_fixture

@test "import_all" {
  load_module import_all
  run import_all
  assert_failure "Module name prefix must ends with '.' or '-' or '_'. Current value: "
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
  assert_failure "Module name prefix must ends with '.' or '-' or '_'. Current value: l#"
}

@test "import_all with prefix 'l'" {
  load_module import_all
  run import_all l
  assert_failure "Module name prefix must ends with '.' or '-' or '_'. Current value: l"
}
