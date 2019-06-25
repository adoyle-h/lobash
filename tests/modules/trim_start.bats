#!/usr/bin/env bats

setup_fixture
load_module trim_start

@test "l.trim_start" {
  run l.trim_start
  assert_success
  assert_output ''
}

@test "l.trim_start ''" {
  run l.trim_start ''
  assert_success
  assert_output ''
}

@test "echo '' | l.trim_start" {
  t() {
    echo '' | l.trim_start
  }
  run t
  assert_success
  assert_output ''
}

@test "l.trim_start '  n'" {
  run l.trim_start '  n'
  assert_success
  assert_output "n"
}

@test "echo '  n' | l.trim_start" {
  t() {
    echo '  n' | l.trim_start
  }
  run t
  assert_success
  assert_output 'n'
}

@test "l.trim_start 'xxx'" {
  run l.trim_start 'xxx'
  assert_success
  assert_output "xxx"
}

@test "echo 'xxx' | l.trim_start" {
  t() {
    echo 'xxx' | l.trim_start
  }
  run t
  assert_success
  assert_output 'xxx'
}

@test "l.trim_start 'ok   '" {
  run l.trim_start 'ok   '
  assert_success
  assert_output 'ok   '
}

@test "echo 'ok   ' | l.trim_start" {
  t() {
    echo 'ok   ' | l.trim_start
  }
  run t
  assert_success
  assert_output 'ok   '
}

@test "l.trim_start '   abc   '" {
  run l.trim_start '   abc   '
  assert_success
  assert_output "abc   "
}

@test "echo '   abc   ' | l.trim_start" {
  t() {
    echo '   abc   ' | l.trim_start
  }
  run t
  assert_success
  assert_output 'abc   '
}

@test "l.trim_start 'prefix.file' 'prefix.'" {
  run l.trim_start 'prefix.file' 'prefix.'
  assert_success
  assert_output "file"
}

@test "echo 'prefix.file' | l.trim_start 'prefix.'" {
  t() {
    echo 'prefix.file' | l.trim_start 'prefix.'
  }
  run t
  assert_success
  assert_output "file"
}

@test "l.trim_start 'prefix.file  ' 'prefix.'" {
  run l.trim_start 'prefix.file  ' 'prefix.'
  assert_success
  assert_output "file  "
}

@test "echo 'prefix.file  ' | l.trim_start 'prefix.'" {
  t() {
    echo 'prefix.file  ' | l.trim_start 'prefix.'
  }
  run t
  assert_success
  assert_output "file  "
}

@test "l.trim_start 'prefix.file' ' prefix.'" {
  run l.trim_start 'prefix.file' ' prefix.'
  assert_success
  assert_output "prefix.file"
}

@test "echo 'prefix.file' | l.trim_start ' prefix.'" {
  t() {
    echo 'prefix.file' | l.trim_start ' prefix.'
  }
  run t
  assert_success
  assert_output "prefix.file"
}

@test "l.trim_start ' prefix.file' ' prefix.'" {
  run l.trim_start ' prefix.file' ' prefix.'
  assert_success
  assert_output "file"
}

@test "echo ' prefix.file' | l.trim_start ' prefix.'" {
  t() {
    echo ' prefix.file' | l.trim_start ' prefix.'
  }
  run t
  assert_success
  assert_output "file"
}

@test "l.trim_start ' prefix. file ' ' prefix.'" {
  run l.trim_start ' prefix. file ' ' prefix.'
  assert_success
  assert_output " file "
}

@test "echo ' prefix. file ' | l.trim_start ' prefix.'" {
  t() {
    echo ' prefix. file ' | l.trim_start ' prefix.'
  }
  run t
  assert_success
  assert_output " file "
}
