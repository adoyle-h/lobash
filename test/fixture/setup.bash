load "$TEST_DIR"/fixture/support/load.bash
load "$TEST_DIR"/fixture/assert/load.bash

load_src() {
  load "$ROOT_DIR"/src/"$1".bash
}

load_module() {
  load_src modules/"$1"
}
