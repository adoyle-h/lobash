# ---
# Category: Path
# Since: 0.1.0
# ---

l.path_normalize() {
  local temp_dir filename target_dir
  temp_dir=$(mktemp -d)
  mkdir -p "$temp_dir/a$1"

  filename=$(basename "$1")
  target_dir="$(cd "$(dirname "$temp_dir/a$1")" && pwd)"
  printf '%s/%s\n' "${target_dir##$temp_dir/a}" "$filename"
}
