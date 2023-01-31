#!/usr/bin/env bats

setup_fixture

L_PROTECTED_PATHS=(
  # Linux
  '/' '/bin' '/boot' '/dev' '/etc' '/home' '/initrd' '/lib' '/lib32' '/lib64' '/proc'
  '/root' '/sbin' '/sys' '/usr' '/usr/bin' '/usr/include' '/usr/lib' '/usr/local'
  '/usr/local/bin' '/usr/local/include' '/usr/local/sbin' '/usr/local/share' '/usr/sbin'
  '/usr/share' '/usr/src' '/var'

  # MacOS
  '/Applications' '/cores' '/Library' '/System' '/System/Applications' '/System/Developer'
  '/System/DriverKit' '/System/iOSSupport' '/System/Library' '/System/Volumes' '/Users'
  '/Users/Shared' '/Volumes' '/private'
)

rm() {
  echo "[rm $*]"
}

@test "l.rm /" {
  run --separate-stderr l.rm /
  assert_failure 5
  assert_output ''
  assert_stderr 'Cannot remove path "/", which is under protected.'
}

@test "l.rm //" {
  run --separate-stderr l.rm //
  assert_failure 4
  assert_output ''
  assert_stderr 'Cannot remove path "//", which contains "//".'
}

@test "l.rm /a/.." {
  run --separate-stderr l.rm /a/..
  assert_failure 5
  assert_output ''
  assert_stderr 'Cannot remove path "/a/..", which is "/"'
}

@test "l.rm '/a/b/c/../..'" {
  run --separate-stderr l.rm ''
  assert_failure 3
  assert_output ''
  assert_stderr 'Cannot remove path "/a/b/c/../.." which is empty.'
}
