if [[ ! -f "$SCRIPT_DIR"/../../dist/lobash.bash ]]; then
  OVERWRITE=yes "$SCRIPT_DIR/../../build"
fi

# shellcheck source=../../dist/lobash.bash
source "$SCRIPT_DIR"/../../dist/lobash.bash
