#!/usr/bin/env bats

setup_fixture

@test "import_category without any parameters" {
  load_module import_category
  run import_category
  assert_failure
  assert_output '[ERROR:LOBASH] Not found any parameters passed to import_category function.'
}

@test "import_category multi categories" {
  load_module import_category
  import_category String File Prompt

  assert_equal "$(type -t ends_with)" ""
  assert_equal "$(type -t l.ends_with)" "function"
  assert_equal "$(type -t l.trim)" "function"
  assert_equal "$(type -t l.ask)" "function"
  assert_equal "$(type -t l.extname)" "function"
}

@test "import_category String without prefix" {
  load_module import_category
  import_category String

  assert_equal "$(type -t ends_with)" ""
  assert_equal "$(type -t l.ends_with)" "function"
  assert_equal "$(type -t l.trim)" "function"
}

@test "import_category String with prefix 'l.'" {
  load_module import_category
  import_category String l.

  assert_equal "$(type -t l.trim)" "function"
  assert_equal "$(type -t l.ends_with)" "function"
}

@test "import_category String with prefix 'l_'" {
  load_module import_category
  import_category String l_

  assert_equal "$(type -t trim)" ""
  assert_equal "$(type -t l_trim)" "function"
}

@test "import_category String with prefix 'l-'" {
  load_module import_category
  import_category String l-

  assert_equal "$(type -t trim)" ""
  assert_equal "$(type -t l-trim)" "function"
}

@test "import_category String with prefix 'l#'" {
  load_module import_category
  run import_category String l#
  assert_failure
  assert_output "[ERROR:LOBASH] Not found categories: l#"
}

@test "import_category String l" {
  load_module import_category
  run import_category String l
  assert_failure
  assert_output "[ERROR:LOBASH] Not found categories: l"
}
