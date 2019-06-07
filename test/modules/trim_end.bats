#!/usr/bin/env bats

setup_fixture
load_module trim_end

@test "l.trim_end" {
  run l.trim_end
  assert_failure 3
  assert_output "Missing argument"
}

@test "l.trim_end ''" {
  run l.trim_end ''
  assert_success
  assert_output ''
}

@test "l.trim_end 'hah  '" {
  run l.trim_end 'hah  '
  assert_success
  assert_output hah
}

@test "l.trim_end 'hah'" {
  run l.trim_end 'hah'
  assert_success
  assert_output hah
}

@test "l.trim_end '   hah" {
  run l.trim_end '   hah'
  assert_success
  assert_output '   hah'
}

@test "l.trim_end '   hah   '" {
  run l.trim_end '   hah   '
  assert_success
  assert_output "   hah"
}

@test "l.trim_end '   hah  bbb '" {
  run l.trim_end '   hah  bbb '
  assert_success
  assert_output  "   hah  bbb"
}

@test "l.trim_end '   hah  bbb ' 'bb '" {
  run l.trim_end '   hah  bbb ' 'bb '
  assert_success
  assert_output  "   hah  b"
}

@test "l.trim_end '   hah  bbb ' 'bb'" {
  run l.trim_end '   hah  bbb ' 'bb'
  assert_success
  assert_output  "   hah  bbb "
}

@test "l.trim_end '   hah  bbb' 'BB'" {
  run l.trim_end '   hah  bbb' 'BB'
  assert_success
  assert_output  "   hah  bbb"
}
