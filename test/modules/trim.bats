#!/usr/bin/env bats

setup_fixture
load_module trim

@test "trim_start" {
  result="$(trim_start '  hah')"
  assert_equal "$result" "hah"

  result="$(trim_start 'hah')"
  assert_equal "$result" "hah"

  result="$(trim_start 'hah   ')"
  assert_equal "$result" "hah   "

  result="$(trim_start '   hah   ')"
  assert_equal "$result" "hah   "

  result="$(trim_start '   hah  bbb ')"
  assert_equal "$result" "hah  bbb "
}

@test "trim_end" {
  result="$(trim_end 'hah  ')"
  assert_equal "$result" "hah"

  result="$(trim_end 'hah')"
  assert_equal "$result" "hah"

  result="$(trim_end 'hah   ')"
  assert_equal "$result" "hah"

  result="$(trim_end '   hah   ')"
  assert_equal "$result" "   hah"

  result="$(trim_end '   hah  bbb ')"
  assert_equal "$result" "   hah  bbb"
}

@test "trim" {
  result="$(trim 'hah  ')"
  assert_equal "$result" "hah"

  result="$(trim 'hah')"
  assert_equal "$result" "hah"

  result="$(trim 'hah   ')"
  assert_equal "$result" "hah"

  result="$(trim '   hah   ')"
  assert_equal "$result" "hah"

  result="$(trim '   hah  bbb ')"
  assert_equal "$result" "hah  bbb"
}
