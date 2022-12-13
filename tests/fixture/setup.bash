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
    declare -p "_loaded_module_lobash_dist" &>/dev/null && return

    # shellcheck source=./dist/lobash.bash
    source "$LOBASH_ROOT_DIR/dist/lobash.bash"

    _lobash.import_internal helpers

    local prefix func uniq_key
    prefix=$( grep -E '^# Prefix: ' "$LOBASH_ROOT_DIR/dist/lobash.bash" 2>/dev/null | sed -E 's/^# Prefix: (.+)/\1/' || true)
    uniq_key=$( grep -E '^# UNIQ_KEY: ' "$LOBASH_ROOT_DIR/dist/lobash.bash" 2>/dev/null | sed -E 's/^# UNIQ_KEY: (.+)/\1/' || true)

    if [[ $prefix != l. ]]; then
      # If dist/lobash.bash has different prefix, create l.<func> function wrappers for test cases
      while read -r func; do
        # echo "$func|$prefix|l.${func##"$prefix"}() { $func \"\$@\"; }" >/dev/tty
        # shellcheck disable=2295
        eval "l.${func##$prefix}() { $func \"\$@\"; }"
      done < <(compgen -A function "$prefix")

      eval "_LOBASH_${uniq_key}_PUBLIC_DEPTH=2"
    fi

    read -r "_loaded_module_lobash_dist" <<<"true"
  }
else
  load_module() {
    [[ $# != 1 ]] && echo "load_module must have one argument at least." >&2 && return 3

    declare -p "_loaded_module_${1//./_}" &>/dev/null && return
    if ! declare -f _lobash.import >/dev/null; then
      _lobash.import_internal imports
    fi
    _lobash.imports "$1"
    read -r "_loaded_module_${1//./_}" <<<"true"
  }
fi

# check_bash <module_name>
check_bash() {
  local module_name=$1
  _lobash.scan_module_metadata "$module_name"

  local compare
  bashver=$(_lobash.get_module_metadata "$module_name" 'Bash')
  compare=$(_lobash.semver_compare "$bashver" "${BASH_VERSINFO[0]}.${BASH_VERSINFO[1]}")

  if (( compare > 0 )); then return 1; fi
}

__ends_with() {
  [[ $1 =~ "$2"$ ]]
  # ]] This comment line will fix syntax highlights
}

# Do not define functions and variables in setup_file,
# because it runs in child process different from test and setup.
setup_file() {
  local module_name
  module_name=$(basename "$BATS_TEST_FILENAME" .bats)

  if __ends_with "$BATS_TEST_FILENAME" "/tests/modules/$module_name.bats"; then
    # This line is important. Set cache of module_meta
    declare -A _LOBASH_MOD_META_CACHE

    load_src load_internals
    _lobash.import_internals module_meta

    local bashver
    if ! check_bash "$module_name"; then
      skip "Only support Bash ${bashver}+, while current BASH_VERSION=$BASH_VERSION"
    fi
  fi

  # Note: Use _setup_file instead of setup_file function in .bats
  if declare -f _setup_file >/dev/null; then _setup_file; fi
}

# https://bats-core.readthedocs.io/en/stable/tutorial.html#avoiding-costly-repeated-setups
setup() {
  local module_name
  module_name=$(basename "$BATS_TEST_FILENAME" .bats)

  # If import has bug, all test cases will failed
  load_src load_internals

  if __ends_with "$BATS_TEST_FILENAME" "/tests/modules/$module_name.bats"; then
    # Auto load module for /tests/modules/*.bats testing
    load_module "$module_name"
  elif __ends_with "$BATS_TEST_FILENAME" "/tests/internals/$module_name.bats"; then
    _lobash.import_internals "$module_name"
  fi

  # Note: Use _setup instead of setup function in .bats
  if declare -f _setup >/dev/null; then _setup; fi
}

{
  # Hack in run() at tests/fixture/bats/lib/bats-core/test_functions.bash
  # set -eETu in run() command
  # shellcheck disable=2016
  eval "$(declare -f run | \
    sed 's/$("$pre_command"/$(set -eETu; "$pre_command"/' | \
    sed 's/ && status=0 || status=$?;/; status=$?;/')"  # this line fix errexit ignored in test condition

  # For debug:
  # declare -f run | sed 's/$("$pre_command"/$(set -eETu; "$pre_command"/' | sed 's/ && status=0 || status=$?;/; status=$?;/' > /dev/tty
}

{
  # To load assert helpers
  if [[ -n ${DOCKER:-} ]]; then
    load /test/support/load.bash
    load /test/assert/load.bash
    load /test/bats-file/load.bash
  else
    load "$LOBASH_TEST_DIR"/fixture/support/load.bash
    load "$LOBASH_TEST_DIR"/fixture/assert/load.bash
    load "$LOBASH_TEST_DIR"/fixture/bats-file/load.bash
  fi

  # To fix run --separate-stderr
  bats_require_minimum_version 1.5.0

  load "$LOBASH_TEST_DIR/fixture/asserts.bash"
}
