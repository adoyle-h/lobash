#!/usr/bin/env bats

setup_fixture
load_module trim_start.p

@test "echo '' | l.trim_start.p" {
  t() {
    echo '' | l.trim_start.p
  }
  run t
  assert_success
  assert_output ''
}

@test "echo '  n' | l.trim_start.p" {
  t() {
    echo '  n' | l.trim_start.p
  }
  run t
  assert_success
  assert_output 'n'
}

@test "echo 'xxx' | l.trim_start.p" {
  t() {
    echo 'xxx' | l.trim_start.p
  }
  run t
  assert_success
  assert_output 'xxx'
}

@test "echo 'ok   ' | l.trim_start.p" {
  t() {
    echo 'ok   ' | l.trim_start.p
  }
  run t
  assert_success
  assert_output 'ok   '
}

@test "echo '   abc   ' | l.trim_start.p" {
  t() {
    echo '   abc   ' | l.trim_start.p
  }
  run t
  assert_success
  assert_output 'abc   '
}

@test "echo 'prefix.file' | l.trim_start.p 'prefix.'" {
  t() {
    echo 'prefix.file' | l.trim_start.p 'prefix.'
  }
  run t
  assert_success
  assert_output "file"
}

@test "echo 'prefix.file  ' | l.trim_start.p 'prefix.'" {
  t() {
    echo 'prefix.file  ' | l.trim_start.p 'prefix.'
  }
  run t
  assert_success
  assert_output "file  "
}

@test "echo 'prefix.file' | l.trim_start.p ' prefix.'" {
  t() {
    echo 'prefix.file' | l.trim_start.p ' prefix.'
  }
  run t
  assert_success
  assert_output "prefix.file"
}

@test "echo ' prefix.file' | l.trim_start.p ' prefix.'" {
  t() {
    echo ' prefix.file' | l.trim_start.p ' prefix.'
  }
  run t
  assert_success
  assert_output "file"
}

@test "echo ' prefix. file ' | l.trim_start.p ' prefix.'" {
  t() {
    echo ' prefix. file ' | l.trim_start.p ' prefix.'
  }
  run t
  assert_success
  assert_output " file "
}
