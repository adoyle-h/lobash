#!/usr/bin/env bats

setup_fixture
load_module is_sourced

@test "l.is_sourced a file" {
  local tmp=$(mktemp -d)
  cat <<EOF >$tmp/a
source "$LOBASH_ROOT_DIR/src/modules/is_sourced.bash"

l.is_sourced
EOF

  cat <<EOF >$tmp/b
#!/usr/bin/env bash

source $tmp/a
EOF

  chmod +x $tmp/b

  run $tmp/b
	assert_success
	assert_output true
}

@test "l.is_sourced a file" {
  local tmp=$(mktemp -d)
  cat <<EOF >$tmp/a
#!/usr/bin/env bash
source "$LOBASH_ROOT_DIR/src/modules/is_sourced.bash"

l.is_sourced
EOF

  cat <<EOF >$tmp/b
#!/usr/bin/env bash

$tmp/a
EOF

  chmod +x "$tmp/a" "$tmp/b"

  run $tmp/b
	assert_success
	assert_output false
}
