#!/usr/bin/env bats

setup_fixture
test_prepare trim_end
load_module trim_end

@test "l.trim_end" {
  run l.trim_end
  assert_success
  assert_output ''
}

@test "l.trim_end ''" {
  run l.trim_end ''
  assert_success
  assert_output ''
}

@test "l.trim_end 'n  '" {
  run l.trim_end 'n  '
  assert_success
  assert_output 'n'
}

@test "l.trim_end 'xxx'" {
  run l.trim_end 'xxx'
  assert_success
  assert_output "xxx"
}

@test "l.trim_end '   ok'" {
  run l.trim_end '   ok'
  assert_success
  assert_output '   ok'
}

@test "l.trim_end '   abc   '" {
  run l.trim_end '   abc   '
  assert_success
  assert_output '   abc'
}

@test "l.trim_end 'file.ext' '.ext'" {
  run l.trim_end 'file.ext' '.ext'
  assert_success
  assert_output "file"
}

@test "l.trim_end 'file.ext  ' '.ext'" {
  run l.trim_end 'file.ext  ' '.ext'
  assert_success
  assert_output "file.ext  "
}

@test "l.trim_end 'file.ext' '.ext '" {
  run l.trim_end 'file.ext' '.ext '
  assert_success
  assert_output "file.ext"
}

@test "l.trim_end 'file.ext ' '.ext '" {
  run l.trim_end 'file.ext ' '.ext '
  assert_success
  assert_output "file"
}

@test "l.trim_end ' file .ext ' '.ext '" {
  run l.trim_end ' file .ext ' '.ext '
  assert_success
  assert_output " file "
}
