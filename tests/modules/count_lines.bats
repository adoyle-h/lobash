#!/usr/bin/env bats

setup_fixture
load_module count_lines

skip

@test "l.count_lines ''" {
  run l.count_lines ''
  assert_success
  assert_output 0
}

@test "l.count_lines '\n'" {
  local str='\n'
  run l.count_lines "$str"
  assert_success
  assert_output 0
}

@test "l.count_lines \$'\n'" {
  local str=$'\n'
  run l.count_lines "$str"
  assert_success
  assert_output 1
}

@test "l.count_lines 'a'" {
  local str=$'a'
  run l.count_lines "$str"
  assert_success
  assert_output 0
}

@test "l.count_lines \$(printf '1\n2')" {
  local str=$(printf '1\n2')
  run l.count_lines "$str"
  assert_success
  assert_output 1
}

@test "l.count_lines \$(printf '1\n2\n')" {
  local str=$(printf '1\n2\n')
  run l.count_lines "$str"
  assert_success
  assert_output 2
}

@test "l.count_lines \$(printf '1\n2\n\n')" {
  local str="$(printf '1\n2\n\n')"
  run l.count_lines "$str"
  assert_success
  assert_output 3
}

@test "l.count_lines \$(printf  '1\n\n\n\n2')" {
  local str=$(printf  '1\n\n\n\n2')
  run l.count_lines "$str"
  assert_success
  assert_output 4
}
