#!/usr/bin/env bats

setup_fixture

@test "l.join (a b c d) " {
  local arr=(a b c d)
  run l.join arr
  assert_success
  assert_output 'a,b,c,d'
  assert [ "$IFS" = $' \t\n' ]
}

@test "l.join (a b c d) ''" {
  local arr=(a b c d)
  run l.join arr ''
  assert_success
  assert_output 'abcd'
  assert [ "$IFS" = $' \t\n' ]
}

@test "l.join (a b c d) ' '" {
  local arr=(a b c d)
  run l.join arr ' '
  assert_success
  assert_output 'a b c d'
  assert [ "$IFS" = $' \t\n' ]
}

@test "l.join (a b c d) ," {
  local arr=(a b c d)
  run l.join arr ,
  assert_success
  assert_output 'a,b,c,d'
  assert [ "$IFS" = $' \t\n' ]
}

@test "l.join ('') ," {
  local arr=('')
  run l.join arr ,
  assert_success
  assert_output ''
  assert [ "$IFS" = $' \t\n' ]
}

@test "l.join ('' '') ," {
  local arr=('' '')
  run l.join arr ,
  assert_success
  assert_output ','
  assert [ "$IFS" = $' \t\n' ]
}

@test "l.join () ," {
  local arr=()
  run l.join arr ,
  assert_success
  assert_output ''
  assert [ "$IFS" = $' \t\n' ]
}
