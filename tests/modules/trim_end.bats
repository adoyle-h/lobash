#!/usr/bin/env bats

setup_fixture
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

@test "echo '' | l.trim_end" {
  t() {
    echo '' | l.trim_end
  }
  run t
  assert_success
  assert_output ''
}

@test "l.trim_end 'n  '" {
  run l.trim_end 'n  '
  assert_success
  # assert_equal "${#output}" 1
  assert_output 'n'
}

@test "echo 'n  ' | l.trim_end" {
  t() {
    echo 'n  ' | l.trim_end
  }
  run t
  assert_success
  assert_output 'n'
}

@test "l.trim_end 'xxx'" {
  run l.trim_end 'xxx'
  assert_success
  assert_output "xxx"
}

@test "echo 'xxx' | l.trim_end" {
  t() {
    echo 'xxx' | l.trim_end
  }
  run t
  assert_success
  assert_output "xxx"
}

@test "l.trim_end '   ok'" {
  run l.trim_end '   ok'
  assert_success
  assert_output '   ok'
}

@test "echo '   ok' | l.trim_end" {
  t() {
    echo '   ok' | l.trim_end
  }
  run t
  assert_success
  assert_output  '   ok'
}

@test "l.trim_end '   abc   '" {
  run l.trim_end '   abc   '
  assert_success
  assert_output '   abc'
}

@test "echo '   abc   ' | l.trim_end" {
  t() {
    echo '   abc   ' | l.trim_end
  }
  run t
  assert_success
  assert_output '   abc'
}

@test "l.trim_end 'file.ext' '.ext'" {
  run l.trim_end 'file.ext' '.ext'
  assert_success
  assert_output "file"
}

@test "echo 'file.ext' | l.trim_end '.ext'" {
  t() {
    echo 'file.ext' | l.trim_end '.ext'
  }
  run t
  assert_success
  assert_output "file"
}

@test "l.trim_end 'file.ext  ' '.ext'" {
  run l.trim_end 'file.ext  ' '.ext'
  assert_success
  assert_output "file.ext  "
}

@test "echo 'file.ext  ' | l.trim_end '.ext'" {
  t() {
    echo 'file.ext  ' | l.trim_end '.ext'
  }
  run t
  assert_success
  assert_output "file.ext  "
}

@test "l.trim_end 'file.ext' '.ext '" {
  run l.trim_end 'file.ext' '.ext '
  assert_success
  assert_output "file.ext"
}

@test "echo 'file.ext' | l.trim_end '.ext '" {
  t() {
    echo 'file.ext' | l.trim_end '.ext '
  }
  run t
  assert_success
  assert_output "file.ext"
}

@test "l.trim_end 'file.ext ' '.ext '" {
  run l.trim_end 'file.ext ' '.ext '
  assert_success
  assert_output "file"
}

@test "echo 'file.ext ' | l.trim_end '.ext '" {
  t() {
    echo 'file.ext ' | l.trim_end '.ext '
  }
  run t
  assert_success
  assert_output "file"
}

@test "l.trim_end ' file .ext ' '.ext '" {
  run l.trim_end ' file .ext ' '.ext '
  assert_success
  assert_output " file "
}

@test "echo ' file .ext ' | l.trim_end '.ext '" {
  t() {
    echo ' file .ext ' | l.trim_end '.ext '
  }
  run t
  assert_success
  assert_output " file "
}
