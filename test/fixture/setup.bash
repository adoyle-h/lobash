# bats not open errexit, nounset and pipefail by default
set -o errexit
set -o nounset
set -o pipefail
shopt -s inherit_errexit

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
  [[ $# != 1 ]] && echo "load_module must have one argument at least." >&2 && return 3
  _l.import "$1" l. false
}

# If import has bug, all test cases will failed
load_src modules/import
