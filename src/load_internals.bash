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


# shellcheck source=./internals/check_shell.bash
# shellcheck source=./internals/dirname.bash
# shellcheck source=./internals/detect_os.bash
# shellcheck source=./internals/consts.bash
# shellcheck source=./internals/debug.bash
# shellcheck source=./internals/warn.bash
# shellcheck source=./internals/error.bash
# shellcheck source=./internals/import.bash
_lobash.import_internals \
  check_shell \
  dirname detect_os detect_shell consts \
  debug warn error \
  import
