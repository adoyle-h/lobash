load "$TEST_DIR"/fixture/support/load.bash
load "$TEST_DIR"/fixture/assert/load.bash

load_src() {
  local path=$1;
  shift
  load "$ROOT_DIR"/src/"$path".bash "$@"
}

load_module() {
  local module_name=$1;
  shift
  _lobash_import "$module_name" "$@"
}

# If import has bug, all test cases will failed
load_src modules/import
