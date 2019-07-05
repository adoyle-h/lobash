#!/usr/bin/env bats

setup_fixture
test_prepare split
load_module split

@test "l.split 'a,asd,bcd,d' ','" {
  local -a target
  local expect=(a asd bcd d)
  l.split 'a,asd,bcd,d' target ','

  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_equal "${target[i]}" "${expect[i]}"
  done
  assert_equal "${#target[@]}" "${#expect[@]}"
}

@test "l.split 'a asd bcd d' ' '" {
  local -a target
  local expect=(a asd bcd d)
  l.split 'a asd bcd d' target ' '

  assert_equal "${#target[@]}" "${#expect[@]}"
  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_equal "${target[i]}" "${expect[i]}"
  done
}

@test "l.split 'a ad bcd d'" {
  local -a target
  local expect=(a ad bcd d)
  l.split 'a ad bcd d' target

  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_equal "${target[i]}" "${expect[i]}"
  done
  assert_equal "${#target[@]}" "${#expect[@]}"
}

@test "l.split '../..' '/'" {
  local -a target
  local expect=('..' '..')
  l.split '../..' target '/'

  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_equal "${target[i]}" "${expect[i]}"
  done
  assert_equal "${#target[@]}" "${#expect[@]}"
}

@test "l.split '../' '/'" {
  local -a target
  local expect=('..' '')
  l.split '../' target '/'

  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_equal "${target[i]}" "${expect[i]}"
  done
  assert_equal "${#target[@]}" "${#expect[@]}"
}

@test "l.split '/../' '/'" {
  local -a target
  local expect=('' '..' '')
  l.split '/../' target '/'

  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_equal "${target[i]}" "${expect[i]}"
  done
  assert_equal "${#target[@]}" "${#expect[@]}"
}

@test "l.split 'a b ' ' '" {
  local -a target
  local expect=('a' 'b' '')
  l.split 'a b ' target ' '

  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_equal "${target[i]}" "${expect[i]}"
  done
  assert_equal "${#target[@]}" "${#expect[@]}"
}

@test "l.split 'ab c' ''" {
  local -a target
  local expect=('a' 'b' ' ' 'c')
  l.split 'ab c' target ''

  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_equal "${target[i]}" "${expect[i]}"
  done
  assert_equal "${#target[@]}" "${#expect[@]}"
}
