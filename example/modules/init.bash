DIST_LOBASH="$SCRIPT_DIR"/../../dist/lobash.bash
if [[ ! -f "$DIST_LOBASH" ]]; then
  echo "Not found $DIST_LOBASH. To build it."
  "$SCRIPT_DIR/../../build" -y -- "$DIST_LOBASH"
fi

# shellcheck source=../../dist/lobash.bash
source "$DIST_LOBASH"
unset DIST_LOBASH
