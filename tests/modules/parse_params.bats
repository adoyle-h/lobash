#!/usr/bin/env bats

setup_fixture

@test "l.parse_params opts args \"\$@\"" {
  local -A opts=()
  local -a args=()
  t() {
    l.parse_params opts args "$@"
  }

  t -a 3 -b12 -c=5 foo -d= bar -e -3 -4 a -F=abc -gh w -ij=5 -km= -5n -xzy --beep=boop baz --no-wow

  assert_equal "$?" 0
  assert_equal "${#opts[@]}" 23
  assert_equal "${opts[a]}" '3'
  assert_equal "${opts[b]}" 'true'
  assert_equal "${opts[1]}" 'true'
  assert_equal "${opts[2]}" 'true'
  assert_equal "${opts[c]}" '5'
  assert_equal "${opts[d]}" ''
  assert_equal "${opts[e]}" 'true'
  assert_equal "${opts[F]}" 'abc'
  assert_equal "${opts[3]}" 'true'
  assert_equal "${opts[4]}" 'a'
  assert_equal "${opts[g]}" 'true'
  assert_equal "${opts[h]}" 'w'
  assert_equal "${opts[i]}" 'true'
  assert_equal "${opts[j]}" '5'
  assert_equal "${opts[k]}" 'true'
  assert_equal "${opts[m]}" ''
  assert_equal "${opts[5]}" 'true'
  assert_equal "${opts[n]}" 'true'
  assert_equal "${opts[x]}" 'true'
  assert_equal "${opts[y]}" 'true'
  assert_equal "${opts[z]}" 'true'
  assert_equal "${opts[beep]}" 'boop'
  assert_equal "${opts[wow]}" 'false'
  assert_equal "${#args[@]}" 3
  assert_equal "${args[0]}" 'foo'
  assert_equal "${args[1]}" 'bar'
  assert_equal "${args[2]}" 'baz'
}

@test "l.parse_params _ args \"\$@\"" {
  local -a args=()
  t() {
    l.parse_params _ args "$@"
  }

  t -a 3 -b12 -c=5 foo -d= bar -e -3 -4 a -F=abc -gh w -ij=5 -km= -5n -xzy --beep=boop baz --no-wow

  assert_equal "$?" 0
  assert_equal "${#args[@]}" 3
  assert_equal "${args[0]}" 'foo'
  assert_equal "${args[1]}" 'bar'
  assert_equal "${args[2]}" 'baz'
}

@test "l.parse_params opts _ \"\$@\"" {
  local -A opts=()
  t() {
    l.parse_params opts _ "$@"
  }

  t -a 3 -b12 -c=5 foo -d= bar -e -3 -4 a -F=abc -gh w -ij=5 -km= -5n -xzy --beep=boop baz --no-wow

  assert_equal "$?" 0
  assert_equal "${#opts[@]}" 23
  assert_equal "${opts[a]}" '3'
  assert_equal "${opts[b]}" 'true'
  assert_equal "${opts[1]}" 'true'
  assert_equal "${opts[2]}" 'true'
  assert_equal "${opts[c]}" '5'
  assert_equal "${opts[d]}" ''
  assert_equal "${opts[e]}" 'true'
  assert_equal "${opts[F]}" 'abc'
  assert_equal "${opts[3]}" 'true'
  assert_equal "${opts[4]}" 'a'
  assert_equal "${opts[g]}" 'true'
  assert_equal "${opts[h]}" 'w'
  assert_equal "${opts[i]}" 'true'
  assert_equal "${opts[j]}" '5'
  assert_equal "${opts[k]}" 'true'
  assert_equal "${opts[m]}" ''
  assert_equal "${opts[5]}" 'true'
  assert_equal "${opts[n]}" 'true'
  assert_equal "${opts[x]}" 'true'
  assert_equal "${opts[y]}" 'true'
  assert_equal "${opts[z]}" 'true'
  assert_equal "${opts[beep]}" 'boop'
  assert_equal "${opts[wow]}" 'false'
}

@test "l.parse_params with --" {
  local -A opts=()
  local -a args=()
  t() {
    l.parse_params opts args "$@"
  }

  t -a 3 -b12 -- -u doge --nyan cat
  assert_equal "$?" 0
  assert_equal "${#opts[@]}" 4
  assert_equal "${opts[a]}" '3'
  assert_equal "${opts[b]}" 'true'
  assert_equal "${opts[1]}" 'true'
  assert_equal "${opts[2]}" 'true'
  assert_equal "${#args[@]}" 4
  assert_equal "${args[0]}" '-u'
  assert_equal "${args[1]}" 'doge'
  assert_equal "${args[2]}" '--nyan'
  assert_equal "${args[3]}" 'cat'
}

@test "l.parse_params with empty parameters" {
  local -A opts=()
  local -a args=()
  t() {
    l.parse_params opts args "$@"
  }

  local output status
  t
  assert_equal "$?" 0
  assert_equal "${#opts[@]}" 0
  assert_equal "${#args[@]}" 0
}

@test "l.parse_params with wrong params" {
  local -A opts=()
  t() {
    l.parse_params opts "$@"
  }

  local output status
  output=$(t 2>&1) || status=$?
  assert_equal "$status" 3
  assert_equal "$output" "parse_params: programming error. Parameters cannot less than 2."
}
