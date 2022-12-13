#!/usr/bin/env bats

setup_fixture

_setup() {
  load_module read_array
}

@test "l.split 'a,asd,bcd,d' target ','" {
  local -a target
  local expect=(a asd bcd d)
  l.split 'a,asd,bcd,d' target ','
  assert_array target expect
}

@test "l.split 'a asd bcd d' target ' '" {
  local -a target
  local expect=(a asd bcd d)
  l.split 'a asd bcd d' target ' '
  assert_array target expect
}

@test "l.split 'a ad bcd d' target" {
  local -a target
  local expect=(a ad bcd d)
  l.split 'a ad bcd d' target
  assert_array target expect
}

@test "l.split '../..' target '/'" {
  local -a target
  local expect=('..' '..')
  l.split '../..' target '/'
  assert_array target expect
}

@test "l.split '../' target '/'" {
  local -a target
  local expect=('..' '')
  l.split '../' target '/'
  assert_array target expect
}

@test "l.split '/../' target '/'" {
  local -a target
  local expect=('' '..' '')
  l.split '/../' target '/'
  assert_array target expect
}

@test "l.split 'a b ' target ' '" {
  local -a target
  local expect=('a' 'b' '')
  l.split 'a b ' target ' '
  assert_array target expect
}

@test "l.split 'ab c' target ''" {
  local -a target
  local expect=('a' 'b' ' ' 'c')
  l.split 'ab c' target ''
  assert_array target expect
}

@test "l.split 'abc' target 'abc'" {
  local -a target
  local expect=('' '')
  l.split 'abc' target 'abc'
  assert_array target expect
}

@test "l.split 'abc' target 'def'" {
  local -a target
  local expect=('abc')
  l.split 'abc' target 'def'
  assert_array target expect
}

@test "l.split 'abcd' target 'cd'" {
  local -a target
  local expect=('ab' '')
  l.split 'abcd' target 'cd'
  assert_array target expect
}

@test "l.split 'abcd' target 'ab'" {
  local -a target
  local expect=('' 'cd')
  l.split 'abcd' target 'ab'
  assert_array target expect
}

@test "l.split 'abcd' target 'bc'" {
  local -a target
  local expect=('a' 'd')
  l.split 'abcd' target 'bc'
  assert_array target expect
}

@test "(l.split 'abcd' target 'bc')" {
  # shellcheck disable=2034
  local -a target
  # shellcheck disable=2034
  local expect=()
  ( l.split 'abcd' target 'bc' )
  assert_array target expect
}

@test "l.split 'a,asd,bcd,d' - ','" {
  local -a target
  local expect=(a asd bcd d)
  l.read_array target < <(l.split 'a,asd,bcd,d' - ',')
  assert_array target expect
}

@test "l.split 'a asd bcd d' - ' '" {
  local -a target
  local expect=(a asd bcd d)
  l.read_array target < <(l.split 'a asd bcd d' - ' ')
  assert_array target expect
}

@test "l.split 'a ad bcd d' -" {
  local -a target
  local expect=(a ad bcd d)
  l.read_array target < <(l.split 'a ad bcd d' -)
  assert_array target expect
}

@test "l.split '../..' - '/'" {
  local -a target
  local expect=('..' '..')
  l.read_array target < <(l.split '../..' - '/')
  assert_array target expect
}

@test "l.split '../' - '/'" {
  local -a target
  local expect=('..' '')
  l.read_array target < <(l.split '../' - '/')
  assert_array target expect
}

@test "l.split '/../' - '/'" {
  local -a target
  local expect=('' '..' '')
  l.read_array target < <(l.split '/../' - '/')
  assert_array target expect
}

@test "l.split 'a b ' - ' '" {
  local -a target
  local expect=('a' 'b' '')
  l.read_array target < <(l.split 'a b ' - ' ')
  assert_array target expect
}

@test "l.split 'ab c' - ''" {
  local -a target
  local expect=('a' 'b' ' ' 'c')
  l.read_array target < <(l.split 'ab c' - '')
  assert_array target expect
}

@test "l.split 'abc' - 'abc'" {
  local -a target
  local expect=('' '')
  l.read_array target < <(l.split 'abc' - 'abc')
  assert_array target expect
}

@test "l.split 'abc' - 'def'" {
  local -a target
  local expect=('abc')
  l.read_array target < <(l.split 'abc' - 'def')
  assert_array target expect
}

@test "l.split 'abcd' - 'cd'" {
  local -a target
  local expect=('ab' '')
  l.read_array target < <(l.split 'abcd' - 'cd')
  assert_array target expect
}

@test "l.split 'abcd' - 'ab'" {
  local -a target
  local expect=('' 'cd')
  l.read_array target < <(l.split 'abcd' - 'ab')
  assert_array target expect
}

@test "l.split 'abcd' - 'bc'" {
  # shellcheck disable=2034
  local -a target
  # shellcheck disable=2034
  local expect=('a' 'd')
  l.read_array target < <(l.split 'abcd' - 'bc')
  assert_array target expect
}
