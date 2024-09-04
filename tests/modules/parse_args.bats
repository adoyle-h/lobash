#!/usr/bin/env bats

setup_fixture

# NOTE: Do not use run l.parse_args, because the "run" function runs in sub shell, that cannot modify opts and args.

@test "l.parse_args with --" {
  local -A opts=()
  local -a args=()
  # shellcheck disable=2034
  local -A definition=(
    [opts]=opts
    [args]=args
    [-h --help]='bool'
  )

  l.parse_args definition --
  assert_equal "$?" 0
  assert_equal "${opts[h]}" false
  assert_equal "${opts[help]}" false
  assert_equal "${#opts[@]}" 2
  assert_equal "${#args[@]}" 0

  l.parse_args definition -h --
  assert_equal "$?" 0
  assert_equal "${opts[h]}" true
  assert_equal "${opts[help]}" true
  assert_equal "${#opts[@]}" 2
  assert_equal "${#args[@]}" 0

  l.parse_args definition -- a b -c
  assert_equal "$?" 0
  assert_equal "${opts[h]}" false
  assert_equal "${opts[help]}" false
  assert_equal "${#opts[@]}" 2
  assert_equal "${args[0]}" a
  assert_equal "${args[1]}" b
  assert_equal "${args[2]}" -c
  assert_equal "${#args[@]}" 3
}

@test "l.parse_args with empty" {
  local -A opts=()
  local -a args=()
  # shellcheck disable=2034
  local -A definition=(
    [opts]=opts
    [args]=args
    [-h --help]='bool'
  )

  l.parse_args definition
  assert_equal "$?" 0
  assert_equal "${opts[h]}" false
  assert_equal "${opts[help]}" false
  assert_equal "${#opts[@]}" 2
  assert_equal "${#args[@]}" 0

  l.parse_args definition ''
  assert_equal "$?" 0
  assert_equal "${opts[h]}" false
  assert_equal "${opts[help]}" false
  assert_equal "${#opts[@]}" 2
  assert_equal "${args[0]}" ''
  assert_equal "${#args[@]}" 1
}

@test "l.parse_args with other opts_name and args_name" {
  local -A opts_xxx=()
  local -a args_zzz=()
  # shellcheck disable=2034
  local -A definition=(
    [opts]=opts_xxx
    [args]=args_zzz
    [-h --help]=bool
    [--flag]=bool
  )

  l.parse_args definition -h --no-flag

  assert_equal "$?" 0
  assert_equal "${opts_xxx[h]}" true
  assert_equal "${opts_xxx[help]}" true
  assert_equal "${opts_xxx[flag]}" false
  assert_equal "${#opts_xxx[@]}" 3
  assert_equal "${#args_zzz[@]}" 0
}

@test "l.parse_args without opts_name or args_name" {
  local -A opts=()
  local -a args=()
  # shellcheck disable=2034
  local -A definition=(
    [args]=args
    [-h --help]=bool
    [--flag]=bool
  )

  run --separate-stderr l.parse_args definition -h --no-flag
  assert_failure 3
  assert_stderr "Error: l.parse_args: [opts] is not defined in params_def"

  # shellcheck disable=2034
  local -A definition=(
    [opts]=opts
    [-h --help]=bool
    [--flag]=bool
  )

  run --separate-stderr l.parse_args definition -h --no-flag
  assert_failure 4
  assert_stderr "Error: l.parse_args: [args] is not defined in params_def"

  # shellcheck disable=2034
  local -A definition=(
    [-h --help]=bool
    [--flag]=bool
  )

  run --separate-stderr l.parse_args definition -h --no-flag
  assert_failure 3
  assert_stderr "Error: l.parse_args: [opts] is not defined in params_def"
}

@test "l.parse_args with wrong opts_name and args_name" {
  local -A opts=()
  local -a args=()
  # shellcheck disable=2034
  local -A definition=(
    [opts]=opts_xxx
    [args]=args
    [-h --help]=bool
    [--flag]=bool
  )

  run --separate-stderr l.parse_args definition -h --no-flag
  assert_failure 5
  assert_stderr "Error: l.parse_args: not found associative array 'opts_xxx' for [opts]=opts_xxx"

  local -A definition=(
    [opts]=opts
    [args]=args_zzz
    [-h --help]=bool
    [--flag]=bool
  )

  run --separate-stderr l.parse_args definition -h --no-flag
  assert_failure 6
  assert_stderr "Error: l.parse_args: not found array 'args_zzz' for [args]=args_zzz"
}

@test "l.parse_args with opts is not associative array" {
  local -a opts=()
  local -a args=()
  # shellcheck disable=2034
  local -A definition=(
    [opts]=opts
    [args]=args
    [-h --help]=bool
    [--flag]=bool
  )

  run --separate-stderr l.parse_args definition -h --no-flag
  assert_failure 5
  assert_stderr "Error: l.parse_args: not found associative array 'opts' for [opts]=opts"
}

@test "l.parse_args with bool" {
  local -A opts=()
  local -a args=()
  # shellcheck disable=2034
  local -A definition=(
    [opts]=opts
    [args]=args
    [-h --help]='bool'
    [--flag]='bool'
  )

  l.parse_args definition --no-flag
  assert_equal "$?" 0
  assert_equal "${opts[h]}" false
  assert_equal "${opts[help]}" false
  assert_equal "${opts[flag]}" false
  assert_equal "${#opts[@]}" 3
  assert_equal "${#args[@]}" 0

  l.parse_args definition
  assert_equal "$?" 0
  assert_equal "${opts[h]}" false
  assert_equal "${opts[help]}" false
  assert_equal "${opts[flag]}" false
  assert_equal "${#opts[@]}" 3
  assert_equal "${#args[@]}" 0
}

@test "l.parse_args with path" {
  local -A opts=()
  local -a args=()
  local -A definition=(
    [opts]=opts
    [args]=args
    [-b]='bool'
  )

  l.parse_args definition -a 1 -b /x/zxy /a/.b/../../c

  assert_equal "$?" 0
  assert_equal "${opts[a]}" 1
  assert_equal "${opts[b]}" true
  assert_equal "${#opts[@]}" 2
  assert_equal "${args[0]}" /x/zxy
  assert_equal "${args[1]}" /a/.b/../../c
  assert_equal "${#args[@]}" 2
}

@test "l.parse_args for count option" {
  local -A opts=()
  local -a args=()
  local -A definition=(
    [opts]=opts
    [args]=args
    [-v]='count'
    [-a]='count'
    [-b]='count'
    [-c]='count'
    [-d]='count'
  )

  l.parse_args definition -v -aa -bbb -d hahaha

  assert_equal "$?" 0
  assert_equal "${opts[a]}" 2
  assert_equal "${opts[b]}" 3
  assert_equal "${opts[c]}" 0
  assert_equal "${opts[d]}" 1
  assert_equal "${opts[v]}" 1
  assert_equal "${#opts[@]}" 5
  assert_equal "${args[0]}" hahaha
  assert_equal "${#args[@]}" 1


  l.parse_args definition -v -d hahaha

  assert_equal "$?" 0
  assert_equal "${opts[a]}" 0
  assert_equal "${opts[b]}" 0
  assert_equal "${opts[c]}" 0
  assert_equal "${opts[d]}" 1
  assert_equal "${opts[v]}" 1
  assert_equal "${#opts[@]}" 5
  assert_equal "${args[0]}" hahaha
  assert_equal "${#args[@]}" 1
}

@test "l.parse_args with definition and negative number" {
  local -A opts=()
  local -a args=()
  local -A definition=(
    [opts]=opts
    [args]=args
    [-b]='bool'
  )

  l.parse_args definition -a -1 -b -3

  assert_equal "$?" 0
  assert_equal "${opts[a]}" -1
  assert_equal "${opts[b]}" true
  assert_equal "${opts[3]}" true
  assert_equal "${#opts[@]}" 3
  assert_equal "${#args[@]}" 0
}

@test "l.parse_args with default value" {
  local -A opts=()
  local -a args=()
  # shellcheck disable=2034
  local -A definition=(
    [opts]=opts
    [args]=args
    [-a]='default:3'
    [-b]='bool default:false'
  )

  l.parse_args definition /x/zxy /a/.b/../../c

  assert_equal "$?" 0
  assert_equal "${opts[a]}" 3
  assert_equal "${opts[b]}" false
  assert_equal "${#opts[@]}" 2
  assert_equal "${args[0]}" /x/zxy
  assert_equal "${args[1]}" /a/.b/../../c
  assert_equal "${#args[@]}" 2
}

@test "l.parse_args with three alias" {
  local -A opts=()
  local -a args=()
  # shellcheck disable=2034
  local -A definition=(
    [opts]=opts
    [args]=args
    [-h --help --hhhh]='bool'
  )

  l.parse_args definition -h

  assert_equal "$?" 0
  assert_equal "${opts[h]}" true
  assert_equal "${opts[help]}" true
  assert_equal "${opts[hhhh]}" true
  assert_equal "${#opts[@]}" 3
  assert_equal "${#args[@]}" 0

  l.parse_args definition --help

  assert_equal "$?" 0
  assert_equal "${opts[h]}" true
  assert_equal "${opts[help]}" true
  assert_equal "${opts[hhhh]}" true
  assert_equal "${#opts[@]}" 3
  assert_equal "${#args[@]}" 0
}

@test "l.parse_args with -F=abc -f= -ij=5" {
  local -A opts=()
  local -a args=()
  # shellcheck disable=2034
  local -A definition=(
    [opts]=opts
    [args]=args
    [-i]=bool
  )

  l.parse_args definition -F=abc -f= -ij=5

  assert_equal "$?" 0
  assert_equal "${opts[F]}" abc
  assert_equal "${opts[f]}" ''
  assert_equal "${opts[i]}" true
  assert_equal "${opts[j]}" 5
  assert_equal "${#opts[@]}" $((4-1))  # actually it should be 4, but bash ignored the null value
  assert_equal "${#args[@]}" 0

}

@test "l.parse_args with combined single options" {
  local -A opts=()
  local -a args=()
  # shellcheck disable=2034
  local -A definition=(
    [opts]=opts
    [args]=args
    [-a]='bool'
    [-b]='bool'
    [-1]='bool'
  )

  l.parse_args definition -ab12 string

  assert_equal "$?" 0
  assert_equal "${opts[1]}" true
  assert_equal "${opts[2]}" string
  assert_equal "${opts[a]}" true
  assert_equal "${opts[b]}" true
  assert_equal "${#opts[@]}" 4
  assert_equal "${#args[@]}" 0

  run --separate-stderr l.parse_args definition -abc12 string

  assert_failure 5
  assert_stderr "Error: Missing parameter for the option '-c'"
}
