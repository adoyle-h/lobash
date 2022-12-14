#!/usr/bin/env bats

setup_fixture

@test "printf '%s\n' {01..10} | l.echo.p" {
  load_module seq

  t() {
    printf '%s\n' {01..10} | l.echo.p
  }
  run t

  assert_success
  assert_output_text <<EOF
01
02
03
04
05
06
07
08
09
10
EOF
}
