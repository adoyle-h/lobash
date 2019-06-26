#!/usr/bin/env bats

setup_fixture
load_module count_lines

@test "l.count_lines ''" {
  run l.count_lines ''
  assert_success
  assert_output 0
}

@test "l.count_lines '\n'" {
  run l.count_lines '\n'
  assert_success
  assert_output 1
}

@test "l.count_lines 'a'" {
  run l.count_lines 'a'
  assert_success
  assert_output 0
}

@test "l.count_lines '1\n2'" {
  run l.count_lines '1\n2'
  assert_success
  assert_output 1
}

@test "l.count_lines '1\n2\n'" {
  run l.count_lines '1\n2\n'
  assert_success
  assert_output 2
}

@test "l.count_lines '1\n2\n\n'" {
  run l.count_lines '1\n2\n\n'
  assert_success
  assert_output 3
}

@test "l.count_lines '1\n\n\n\n2'" {
  run l.count_lines '1\n\n\n\n2'
  assert_success
  assert_output 4
}
