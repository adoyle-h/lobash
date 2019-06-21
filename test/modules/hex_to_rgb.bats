#!/usr/bin/env bats

setup_fixture
load_module hex_to_rgb

@test "l.hex_to_rgb '#FFFFFF'" {
  run l.hex_to_rgb '#FFFFFF'
  assert_success
  assert_equal "${#lines[@]}" 3
  assert_line -n 0 255
  assert_line -n 1 255
  assert_line -n 2 255

  run l.hex_to_rgb '#ffffff'
  assert_success
  assert_equal "${#lines[@]}" 3
  assert_line -n 0 255
  assert_line -n 1 255
  assert_line -n 2 255
}

@test "l.hex_to_rgb '000000'" {
  run l.hex_to_rgb '000000'
  assert_success
  assert_equal "${#lines[@]}" 3
  assert_line -n 0 0
  assert_line -n 1 0
  assert_line -n 2 0
}

@test "l.hex_to_rgb '#FFF'" {
  run l.hex_to_rgb '#FFF'
  assert_success
  assert_equal "${#lines[@]}" 3
  assert_line -n 0 255
  assert_line -n 1 255
  assert_line -n 2 255

  run l.hex_to_rgb '#fff'
  assert_success
  assert_equal "${#lines[@]}" 3
  assert_line -n 0 255
  assert_line -n 1 255
  assert_line -n 2 255
}

@test "l.hex_to_rgb '000'" {
  run l.hex_to_rgb '000'
  assert_success
  assert_equal "${#lines[@]}" 3
  assert_line -n 0 0
  assert_line -n 1 0
  assert_line -n 2 0
}

@test "l.hex_to_rgb 'abc'" {
  run l.hex_to_rgb 'abc'
  assert_success
  assert_equal "${#lines[@]}" 3
  assert_line -n 0 170
  assert_line -n 1 187
  assert_line -n 2 204
}

@test "l.hex_to_rgb wrong argument" {
  run l.hex_to_rgb 'a'
  assert_failure 3
  assert_output 'Argument is not a hex.'

  run l.hex_to_rgb 'ab'
  assert_failure 3
  assert_output 'Argument is not a hex.'

  run l.hex_to_rgb 'abcd'
  assert_failure 3
  assert_output 'Argument is not a hex.'

  run l.hex_to_rgb '12345'
  assert_failure 3
  assert_output 'Argument is not a hex.'

  run l.hex_to_rgb '1234567890'
  assert_failure 3
  assert_output 'Argument is not a hex.'
}
