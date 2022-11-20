#!/usr/bin/env bats

setup_fixture
test_prepare join
load_module join

@test "l.join (a b c d) " {
  local arr=(a b c d)
  run l.join arr
  assert_success
  assert_output 'a,b,c,d'
}

@test "l.join (a b c d) ''" {
  local arr=(a b c d)
  run l.join arr ''
  assert_success
  assert_output 'abcd'
}

@test "l.join (a b c d) ' '" {
  local arr=(a b c d)
  run l.join arr ' '
  assert_success
  assert_output 'a b c d'
}

@test "l.join (a b c d) ," {
  local arr=(a b c d)
  run l.join arr ,
  assert_success
  assert_output 'a,b,c,d'
}

@test "l.join ('') ," {
  local arr=('')
  run l.join arr ,
  assert_success
  assert_output ''
}

@test "l.join ('' '') ," {
  local arr=('' '')
  run l.join arr ,
  assert_success
  assert_output ','
}

@test "l.join () ," {
  local arr=()
  run l.join arr ,
  assert_success
  assert_output ''
}
