#!/usr/bin/env bats

setup_fixture
load_module split

@test "l.split 'a,asd,bcd,d' ','" {
  local expect=(a asd bcd d)
  run l.split 'a,asd,bcd,d' ','

  assert_success
  assert_equal ${#lines[@]} ${#expect[@]}
  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_line -n $i ${expect[i]}
  done
}

@test "l.split 'a asd bcd d' ' '" {
  local expect=(a asd bcd d)
  run l.split 'a asd bcd d' ' '

  assert_success
  assert_equal ${#lines[@]} ${#expect[@]}
  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_line -n $i ${expect[i]}
  done
}

@test "l.split 'a ad bcd d'" {
  local expect=(a ad bcd d)
  run l.split 'a ad bcd d'

  assert_success
  assert_equal ${#lines[@]} ${#expect[@]}
  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_line -n $i ${expect[i]}
  done
}

@test "l.split '../..' '/'" {
  local expect=('..' '..')
  run l.split '../..' '/'

  assert_success
  assert_equal ${#lines[@]} ${#expect[@]}
  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_line -n $i ${expect[i]}
  done
}

@test "l.split '../' '/'" {
  local expect=('..' '')
  run l.split '../' '/'

  assert_success
  assert_equal ${#lines[@]} ${#expect[@]}
  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_line -n $i ${expect[i]}
  done
}

@test "l.split '/../' '/'" {
  local expect=('' '..' '')
  run l.split '../' '/'

  assert_success
  assert_equal ${#lines[@]} ${#expect[@]}
  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_line -n $i ${expect[i]}
  done
}

@test "l.split 'a b ' ' '" {
  local expect=('a' 'b' '')
  run l.split 'a b ' ' '

  assert_success
  assert_equal ${#lines[@]} ${#expect[@]}
  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_line -n $i ${expect[i]}
  done
}

@test "l.split 'ab c' ''" {
  local expect=('a' 'b' '' 'c')
  run l.split 'ab c' ''

  assert_success
  assert_equal ${#lines[@]} ${#expect[@]}
  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_line -n $i ${expect[i]}
  done
}
