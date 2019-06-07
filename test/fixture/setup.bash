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

# Fix: bats-core reset "set -e"
# https://github.com/bats-core/bats-core/blob/master/libexec/bats-core/bats-exec-test#L60
run() {
  local origFlags="$-"
  set +eET
  local origIFS="$IFS"
  output="$(set -e; "$@" 2>&1)"
  status="$?"
  IFS=$'\n' lines=($output)
  IFS="$origIFS"
  set "-$origFlags"
}

# If import has bug, all test cases will failed
load_src modules/import
