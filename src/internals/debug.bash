# Usage: debug <message>...
# Print logs to stdout.
# If LOBASH_DEBUG set, print Lobash debug logs to stdout
# If LOBASH_DEBUG_OUTPUT set, logs pipe to $LOBASH_DEBUG_OUTPUT instead of stdout
#
# It will not print logs to stdout in below scenario:
#
#   LOBASH_DEBUG=1
#   foo() { debug hello; }
#   bar=$(foo) # => Not see any log in shell
#
# LOBASH_DEBUG_OUTPUT can resolve the problem.
#
#   LOBASH_DEBUG=1
#   LOBASH_DEBUG_OUTPUT=/tmp/log
#   foo() { debug2 hello; }
#   bar=$(foo) # => Still not see any log in shell, but logs records in file /tmp/log
debug() {
  if [[ -z ${LOBASH_DEBUG:-} ]]; then return; fi

  local func=${FUNCNAME[1]}

  if [[ -z ${LOBASH_DEBUG_OUTPUT:-} ]]; then
    echo "[DEBUG:LOBASH:$func] $*"
  else
    echo "[DEBUG:LOBASH:$func] $*" >> "$LOBASH_DEBUG_OUTPUT"
  fi
}
