# ---
# Category: Console
# Since: 0.1.0
# Usage: l.debug_time [label]
# ---

l.debug_time() {
  local label=${1:-debug}
  local key=_LOBASH_DEBUG_TIME_$label
  local last_time=${!key:-}

  printf '[%s] Current seconds: %s\n' "$label" $SECONDS

  if [[ -n $last_time ]]; then
    printf '[%s] Last seconds: %s\n[%s] Elapsed: %s\n' "$label" "$last_time" "$label" $(( "$SECONDS" - "$last_time" ))
    read -r "$key" <<< $SECONDS
  else
    declare -g "$key"=$SECONDS
  fi
}
