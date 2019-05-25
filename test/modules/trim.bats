#!/usr/bin/env bats

setup_fixture

@test "trim_start" {
  load_module trim_start

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
  load_module trim_end

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
  load_module trim

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
