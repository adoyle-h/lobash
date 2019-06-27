#!/usr/bin/env bats

setup_fixture
load_module cmd_args

@test "l.cmd_args opts args \"$@\"" {
  local -A store
  local opts args
  t() {
    l.cmd.command store 'get'
    l.cmd.argument store 'name'
    l.cmd.argument store 'pwd' 'The password'
    l.cmd.argument store 'project' 'The project' /^[[:alnum:]]+$/
    l.cmd.argument store 'value' _no_desc /^[[:alnum:]]+$/ 'default value'
    l.cmd.option store '-c' '--config' 'config path'
    l.cmd.option store '-x' _no_long _no_desc 5
    l.cmd.parse store opts args "$@"
  }

  t -x 3 -y 4 -n5 -abc --beep=boop foo bar baz

  assert_equal "$?" 0
  assert_equal "${#opts[@]}" 7
  assert_equal "${opts[x]}" '3'
  assert_equal "${opts[y]}" '4'
  assert_equal "${opts[n]}" '5'
  assert_equal "${opts[a]}" 'true'
  assert_equal "${opts[b]}" 'true'
  assert_equal "${opts[c]}" 'true'
  assert_equal "${opts[beep]}" 'boop'
  assert_equal "${#args[@]}" 3
  assert_equal "${args[0]}" 'foo'
  assert_equal "${args[1]}" 'bar'
  assert_equal "${args[2]}" 'baz'
}
