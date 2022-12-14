#!/usr/bin/env bats

setup_fixture

@test "l.sedi 's/123/456/g'" {
  local file="$BATS_TEST_TMPDIR/testfile"
  echo 'abc|123|lol|123' > "$file"

  t() {
    l.sedi 's/123/456/g' "$file"
    cat "$file"
  }
  run t

  assert_success
  assert_output 'abc|456|lol|456'
}
