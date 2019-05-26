# ---
# Category: Collection
# Since: 0.1.0
# ---

# Usage: array_includes match "${array[@]}"
array_includes() {
  local match="$1"
  local e
  shift
  for e; do [[ "$e" == "$match" ]] && echo true && return 0; done

  echo false
  return 0
}
