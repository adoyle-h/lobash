#!/usr/bin/env bats

setup_fixture

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

@test "l.split 'abc' 'abc'" {
  local -a target
  local expect=('' '')
  l.split 'abc' target 'abc'

  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_equal "${target[i]}" "${expect[i]}"
  done
  assert_equal "${#target[@]}" "${#expect[@]}"
}

@test "l.split 'abc' 'def'" {
  local -a target
  local expect=('abc')
  l.split 'abc' target 'def'

  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_equal "${target[i]}" "${expect[i]}"
  done
  assert_equal "${#target[@]}" "${#expect[@]}"
}

@test "l.split 'abcd' 'cd'" {
  local -a target
  local expect=('ab' '')
  l.split 'abcd' target 'cd'

  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_equal "${target[i]}" "${expect[i]}"
  done
  assert_equal "${#target[@]}" "${#expect[@]}"
}

@test "l.split 'abcd' 'ab'" {
  local -a target
  local expect=('' 'cd')
  l.split 'abcd' target 'ab'

  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_equal "${target[i]}" "${expect[i]}"
  done
  assert_equal "${#target[@]}" "${#expect[@]}"
}

@test "l.split 'abcd' 'bc'" {
  local -a target
  local expect=('a' 'd')
  l.split 'abcd' target 'bc'

  for (( i=0 ; i < ${#expect[@]} ; i++ )) ; do
    assert_equal "${target[i]}" "${expect[i]}"
  done
  assert_equal "${#target[@]}" "${#expect[@]}"
}
