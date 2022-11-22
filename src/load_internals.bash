# This line is important, do not remove. See docs/internal-modules.md
if ! declare -p _LOBASH_MOD_META_CACHE &>/dev/null; then
  declare -A _LOBASH_MOD_META_CACHE
fi

_lobash.import_internal() {
  local src_dir
  if [[ -n ${IS_LOBASH_TEST:-} ]]; then
    src_dir="$LOBASH_ROOT_DIR/src/internals"
  else
    src_dir="$(dirname "${BASH_SOURCE[0]}")/internals"
  fi
  source "$src_dir/$1.bash"
}

_lobash.import_internals() {
  local name
  for name in "$@"; do
    _lobash.import_internal "$name"
  done
}

_lobash.import_basic_internals() {
  if [[ -n ${IS_LOBASH_TEST:-} ]]; then
    # shellcheck source=./internals/basic_internals.bash
    source "$LOBASH_ROOT_DIR/src/internals/basic_internals.bash"
  else
    # shellcheck source=./internals/basic_internals.bash
    source "$(dirname "${BASH_SOURCE[0]}")/internals/basic_internals.bash"
  fi

  _lobash.import_internals "${_LOBASH_BASIC_INTERNALS[@]}"
  unset -v _LOBASH_BASIC_INTERNALS
}

_lobash.import_basic_internals
unset -f _lobash.import_basic_internals
