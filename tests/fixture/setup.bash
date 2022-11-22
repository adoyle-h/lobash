# bats not open errexit, nounset and pipefail by default
set -o errexit
# set -o nounset
set -o pipefail
(shopt -p inherit_errexit &>/dev/null) && shopt -s inherit_errexit

if [[ -n ${DOCKER:-} ]]; then
  load /test/support/load.bash
  load /test/assert/load.bash
else
  load "$LOBASH_TEST_DIR"/fixture/support/load.bash
  load "$LOBASH_TEST_DIR"/fixture/assert/load.bash
fi

load_src() {
  local path=$1;
  shift
  load "$LOBASH_ROOT_DIR/src/$path.bash" "$@"
}

load_fixtrue() {
  local path=$1;
  shift
  load "$LOBASH_TEST_DIR/fixtrue/$path.bash" "$@"
}

if [[ $LOBASH_USE_DIST == true ]]; then
  load_module() {
    # shellcheck source=./dist/lobash.bash
    source "$LOBASH_ROOT_DIR/dist/lobash.bash"
  }
else
  load_module() {
    [[ $# != 1 ]] && echo "load_module must have one argument at least." >&2 && return 3
    _lobash.imports "$1"
  }
fi

# Fix: bats-core reset "set -e"
# https://github.com/bats-core/bats-core/blob/master/libexec/bats-core/bats-exec-test#L60
run() {
  local origFlags="$-"
  local origIFS="$IFS"
  set +eET
  # bats has bug, /lobash/tests/fixture/bats/libexec/bats-core/bats-exec-test: line 7: BASH_SOURCE: unbound variable
  output="$(set -o nounset; set -e; "$@" 2>&1)"
  status="$?"
  IFS=$'\n' lines=($output)
  IFS="$origIFS"
  set "-$origFlags"
}

# check_bash <module_name>
check_bash() {
  local module_name=$1
  _lobash.scan_module_metadata "$module_name"
  local bashver compare
  bashver=$(_lobash.get_module_metadata "$module_name" 'Bash')
  compare=$(_lobash.semver_compare "$bashver" "${BASH_VERSINFO[0]}.${BASH_VERSINFO[1]}")

  if (( compare > 0 )); then
    echo "[Skip Test] '$module_name' support Bash $bashver+, while current BASH_VERSION=$BASH_VERSION"
    exit 0
  fi
}

test_prepare() {
  local module_name=$1
  # This line is important. Set cache map variable
  declare -A _LOBASH_MOD_META_CACHE
  _lobash.import_internals module_meta

  check_bash "$module_name"
}

# If import has bug, all test cases will failed
load_src load_internals
