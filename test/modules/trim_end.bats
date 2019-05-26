#!/usr/bin/env bats

setup_fixture
load_module trim_end

@test "trim_end 'hah  '" {
  run trim_end 'hah  '
  assert_success
  assert_output hah
}

@test "trim_end 'hah'" {
  run trim_end 'hah'
  assert_success
  assert_output hah
}

@test "trim_end '   hah" {
  run trim_end '   hah'
  assert_success
  assert_output '   hah'
}

@test "trim_end '   hah   '" {
  run trim_end '   hah   '
  assert_success
  assert_output "   hah"
}

@test "trim_end '   hah  bbb '" {
  run trim_end '   hah  bbb '
  assert_success
  assert_output  "   hah  bbb"
}
