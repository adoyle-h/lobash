# ---
# Category: Console
# Since: 0.1.0
# ---

# Usage: l.debug_count [label]
# Attention: l.debug_count should run in same process. It will not work in subprocess such as $(l.debug_count)
l.debug_count() {
  local label=${1:-debug}
  local key=_LOBASH_DEBUG_COUNT_$label

  if [[ -z ${!key} ]]; then
    declare -g "$key"=0
  fi

  read -r "$key" <<< $(( ${!key} + 1 ))

  printf '[%s] count: %s\n' "$label" "${!key}"
}
