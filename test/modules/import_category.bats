#!/usr/bin/env bats

setup_fixture

@test "import_category without any parameters" {
  load_module import_category
  run import_category
  assert_failure
  assert_output "Missing category parameter."
}

@test "import_category String without prefix" {
  load_module import_category
  run import_category String
  assert_failure
  assert_output "Invalid prefix parameter. It must ends with '.' or '-' or '_'. Current value: "
}

@test "import_category String with prefix 'l.'" {
  load_module import_category
  import_category String l.

  assert_equal "$(type -t split)" "function"
  assert_equal "$(type -t str_size)" "function"
}

@test "import_category String with prefix 'l_'" {
  load_module import_category
  import_category String l_

  assert_equal "$(type -t split)" ""
  assert_equal "$(type -t l_split)" "function"
}

@test "import_category with String prefix 'l-'" {
  load_module import_category
  import_category String l-

  assert_equal "$(type -t split)" ""
  assert_equal "$(type -t l-split)" "function"
}

@test "import_category String with prefix 'l#'" {
  load_module import_category
  run import_category String l#
  assert_failure
  assert_output "Invalid prefix parameter. It must ends with '.' or '-' or '_'. Current value: l#"
}

@test "import_category String l" {
  load_module import_category
  run import_category String l
  assert_failure
  assert_output "Invalid prefix parameter. It must ends with '.' or '-' or '_'. Current value: l"
}
