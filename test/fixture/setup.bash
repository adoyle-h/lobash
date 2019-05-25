load "$TEST_DIR"/fixture/support/load.bash
load "$TEST_DIR"/fixture/assert/load.bash

load_src() {
  local path=$1;
  shift
  load "$ROOT_DIR"/src/"$path".bash "$@"
}

load_module() {
  local path=$1;
  shift
  load_src modules/"$path" "$@"
}