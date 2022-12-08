#!/usr/bin/env bats

setup_fixture

@test "echo '' | l.trim_end.p" {
  t() {
    echo '' | l.trim_end.p
  }
  run t
  assert_success
  assert_output ''
}

@test "echo 'n  ' | l.trim_end.p" {
  t() {
    echo 'n  ' | l.trim_end.p
  }
  run t
  assert_success
  assert_output 'n'
}

@test "echo 'xxx' | l.trim_end.p" {
  t() {
    echo 'xxx' | l.trim_end.p
  }
  run t
  assert_success
  assert_output "xxx"
}

@test "echo '   ok' | l.trim_end.p" {
  t() {
    echo '   ok' | l.trim_end.p
  }
  run t
  assert_success
  assert_output  '   ok'
}

@test "echo '   abc   ' | l.trim_end.p" {
  t() {
    echo '   abc   ' | l.trim_end.p
  }
  run t
  assert_success
  assert_output '   abc'
}

@test "echo 'file.ext' | l.trim_end.p '.ext'" {
  t() {
    echo 'file.ext' | l.trim_end.p '.ext'
  }
  run t
  assert_success
  assert_output "file"
}

@test "echo 'file.ext  ' | l.trim_end.p '.ext'" {
  t() {
    echo 'file.ext  ' | l.trim_end.p '.ext'
  }
  run t
  assert_success
  assert_output "file.ext  "
}

@test "echo 'file.ext' | l.trim_end.p '.ext '" {
  t() {
    echo 'file.ext' | l.trim_end.p '.ext '
  }
  run t
  assert_success
  assert_output "file.ext"
}

@test "echo 'file.ext ' | l.trim_end.p '.ext '" {
  t() {
    echo 'file.ext ' | l.trim_end.p '.ext '
  }
  run t
  assert_success
  assert_output "file"
}

@test "echo ' file .ext ' | l.trim_end.p '.ext '" {
  t() {
    echo ' file .ext ' | l.trim_end.p '.ext '
  }
  run t
  assert_success
  assert_output " file "
}
