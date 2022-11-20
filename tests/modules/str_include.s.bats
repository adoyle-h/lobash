#!/usr/bin/env bats

setup_fixture
test_prepare str_include.s
load_module str_include.s

@test "l.str_include.s hello he" {
  run l.str_include.s hello he
  assert_success
  assert_output true
}

@test "l.str_include.s hello ''" {
  run l.str_include.s hello ''
  assert_success
  assert_output true

  local s=''
  run l.str_include.s hello "$s"
  assert_success
  assert_output true
}

@test "l.str_include.s hello ' he'" {
  run l.str_include.s hello ' he'
  assert_success
  assert_output false
}

@test "l.str_include.s hello 'o '" {
  run l.str_include.s hello 'o '
  assert_success
  assert_output false
}

@test "l.str_include.s 'hello world' ' '" {
  run l.str_include.s 'hello world' ' '
  assert_success
  assert_output true
}

@test "l.str_include.s 'hello world' 'lo w'" {
  run l.str_include.s 'hello world' 'lo w'
  assert_success
  assert_output true
}

# Maybe bats-core bug
# @test "l.str_include.s 'hell$o world' '$'" {
#   skip
#   t() {
#     l.str_include.s 'hell$o world' '$'
#   }
#   run t
#   assert_success
#   assert_output true
# }

@test "l.str_include.s '[hello world' '['" {
  run l.str_include.s '[hello world' '['
  assert_success
  assert_output true
}
