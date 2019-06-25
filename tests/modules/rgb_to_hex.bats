#!/usr/bin/env bats

setup_fixture
load_module rgb_to_hex

@test "l.rgb_to_hex 255 255 255" {
  run l.rgb_to_hex 255 255 255
  assert_success
  assert_output '#ffffff'
}

@test "l.rgb_to_hex 170 187 204" {
  run l.rgb_to_hex 170 187 204
  assert_success
  assert_output '#aabbcc'
}

@test "l.rgb_to_hex 0 0 0" {
  run l.rgb_to_hex 0 0 0
  assert_success
  assert_output '#000000'
}

@test "l.rgb_to_hex arguments are not numbers" {
  run l.rgb_to_hex a b c
  assert_failure 4
  assert_output 'The first argument is not a number'

  run l.rgb_to_hex 1 b c
  assert_failure 5
  assert_output 'The second argument is not a number'

  run l.rgb_to_hex 1 2 c
  assert_failure 6
  assert_output 'The third argument is not a number'
}

@test "l.rgb_to_hex wrong arguments" {
  run l.rgb_to_hex 0
  assert_failure 3
  assert_output 'The arguments size not equal 3'

  run l.rgb_to_hex abc
  assert_failure 3
  assert_output 'The arguments size not equal 3'

  run l.rgb_to_hex 1 2 3 4
  assert_failure 3
  assert_output 'The arguments size not equal 3'
}
