# ---
# Category: Debug
# Since: 0.1.0
# Usage: l.trace_time [label]
# Dependent: now
# Description: Print current timestamp, last timestamp and the elapsed time in millisecond.
# ---

l.trace_time() {
  local label=${1:-debug}
  local key=_LOBASH_TRACE_TIME_$label
  local last_time=${!key:-}
  local current
  current="$(l.now)"

  printf '[%s] Current Timestamp: %s\n' "$label" "$current"

  if [[ -n $last_time ]]; then
    printf '[%s] Last Timestamp: %s\n[%s] Elapsed: %s\n' "$label" "$last_time" "$label" $(( $(l.now) - last_time ))
    read -r "$key" <<< "$current"
  else
    read -r "$key" <<< "$current"
  fi
}
