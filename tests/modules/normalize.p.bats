#!/usr/bin/env bats

setup_fixture
load_module normalize.p

@test "echo '' | l.normalize.p" {
  t() {
    echo '' | l.normalize.p
  }
  run t
  assert_success
  assert_output '.'
}

@test "echo '.' | l.normalize.p" {
  t() {
    echo '.' | l.normalize.p
  }
  run t
  assert_success
  assert_output '.'
}

@test "echo './' | l.normalize.p" {
  t() {
    echo './' | l.normalize.p
  }
  run t
  assert_success
  assert_output '.'
}

@test "echo '..' | l.normalize.p" {
  t() {
    echo '..' | l.normalize.p
  }
  run t
  assert_success
  assert_output '..'
}

@test "echo '../' | l.normalize.p" {
  t() {
    echo '../' | l.normalize.p
  }
  run t
  assert_success
  assert_output '..'
}

@test "echo '../../' | l.normalize.p" {
  t() {
    echo '../../' | l.normalize.p
  }
  run t
  assert_success
  assert_output '../..'
}

@test "echo '/' | l.normalize.p" {
  t() {
    echo '/' | l.normalize.p
  }
  run t
  assert_success
  assert_output '/'
}

@test "echo '/../' | l.normalize.p" {
  t() {
    echo '/../' | l.normalize.p
  }
  run t
  assert_success
  assert_output '/'
}

@test "echo '/a/../../' | l.normalize.p" {
  t() {
    echo '/a/../../' | l.normalize.p
  }
  run t
  assert_success
  assert_output '/'
}

@test "echo '/a//b' | l.normalize.p" {
  t() {
    echo '/a//b' | l.normalize.p
  }
  run t
  assert_success
  assert_output '/a/b'
}

@test "echo '/a/b/c' | l.normalize.p" {
  t() {
    echo '/a/b/c' | l.normalize.p
  }
  run t
  assert_success
  assert_output '/a/b/c'
}

@test "echo '/a/b/c/' | l.normalize.p" {
  t() {
    echo '/a/b/c/' | l.normalize.p
  }
  run t
  assert_success
  assert_output '/a/b/c'
}

@test "echo '/a/b/c//' | l.normalize.p" {
  t() {
    echo '/a/b/c//' | l.normalize.p
  }
  run t
  assert_success
  assert_output '/a/b/c'
}

@test "echo '/a/b/c///' | l.normalize.p" {
  t() {
    echo '/a/b/c///' | l.normalize.p
  }
  run t
  assert_success
  assert_output '/a/b/c'
}

@test "echo '/a/b/c/././' | l.normalize.p" {
  t() {
    echo '/a/b/c/././' | l.normalize.p
  }
  run t
  assert_success
  assert_output '/a/b/c'
}

@test "echo '/a/b/c/.' | l.normalize.p" {
  t() {
    echo '/a/b/c/.' | l.normalize.p
  }
  run t
  assert_success
  assert_output '/a/b/c'
}

@test "echo '/a/b/c/..' | l.normalize.p" {
  t() {
    echo '/a/b/c/..' | l.normalize.p
  }
  run t
  assert_success
  assert_output '/a/b'
}

@test "echo '/a/b/./c' | l.normalize.p" {
  t() {
    echo '/a/b/./c' | l.normalize.p
  }
  run t
  assert_success
  assert_output '/a/b/c'
}

@test "echo '/a/../b/../c' | l.normalize.p" {
  t() {
    echo '/a/../b/../c' | l.normalize.p
  }
  run t
  assert_success
  assert_output '/c'
}

@test "echo '/a/../b/c' | l.normalize.p" {
  t() {
    echo '/a/../b/c' | l.normalize.p
  }
  run t
  assert_success
  assert_output '/b/c'
}

@test "echo '/a/b/../c.bash' | l.normalize.p" {
  t() {
    echo '/a/b/../c.bash' | l.normalize.p
  }
  run t
  assert_success
  assert_output '/a/c.bash'
}
