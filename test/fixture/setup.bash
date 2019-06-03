if [[ -n ${CI:-} ]]; then
  load /test/support/load.bash
  load /test/assert/load.bash
else
  load "$LOBASH_TEST_DIR"/fixture/support/load.bash
  load "$LOBASH_TEST_DIR"/fixture/assert/load.bash
fi

load_src() {
  local path=$1;
  shift
  load "$LOBASH_ROOT_DIR"/src/"$path".bash "$@"
}

load_module() {
  local module_name=$1;
  shift
  _l.import "$module_name" "$@"
}

# If import has bug, all test cases will failed
load_src modules/import
