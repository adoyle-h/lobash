#!/usr/bin/env bats

setup_fixture
load_module trim_start

@test "l.trim_start '  hah'" {
  run l.trim_start '  hah'
  assert_success
  assert_output "hah"
}

@test "l.trim_start 'hah'" {
  run l.trim_start 'hah'
  assert_success
  assert_output "hah"
}

@test "l.trim_start  'hah   '" {
  run l.trim_start  'hah   '
  assert_success
  assert_output "hah   "
}

@test "l.trim_start '   hah   '" {
  run l.trim_start '   hah   '
  assert_success
  assert_output "hah   "
}

@test "l.trim_start  '   hah  bbb '" {
  run l.trim_start '   hah  bbb '
  assert_success
  assert_output "hah  bbb "
}

@test "l.trim_start '  hah' ''" {
  run l.trim_start '  hah' ''
  assert_success
  assert_output "  hah"
}

@test "l.trim_start '  hah' ' '" {
  run l.trim_start '  hah' ' '
  assert_success
  assert_output " hah"
}

@test "l.trim_start '  hah' ' h'" {
  run l.trim_start '  hah' ' h'
  assert_success
  assert_output "  hah"
}

@test "l.trim_start '  hah' '  h'" {
  run l.trim_start '  hah' '  h'
  assert_success
  assert_output "ah"
}

@test "l.trim_start '  hah' 'h'" {
  run l.trim_start '  hah' 'h'
  assert_success
  assert_output "  hah"
}

@test "l.trim_start '  hah' 'h  '" {
  run l.trim_start '  hah' 'h  '
  assert_success
  assert_output "  hah"
}
