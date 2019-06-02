# ---
# Category: Path
# Since: 0.1.0
# Usage: l.path_normalize <path>
# ---

l.path_normalize() {
  if [[ -z ${1:-} ]]; then
    echo 'Input path cannot be empty string' >&2
    return 2
  fi

  if [[ .${1##.} == "$1" ]]; then
    echo 'Input path cannot starts with .' >&2
    return 3
  fi

  if [[ $1 == '/' ]]; then
    echo '/'
    return 0
  fi

  local temp_dir filename target_dir output
  temp_dir=$(mktemp -d)
  mkdir -p "$temp_dir/t/$1"

  filename=$(basename "$1")
  if [[ $filename == '.' ]]; then
    filename=''
  fi
  target_dir="$(cd "$(dirname "$temp_dir/t/$1")" && pwd)"
  output=$(printf '%s/%s\n' "${target_dir##$temp_dir/t}" "$filename")

  if [[ $output == / ]]; then
    echo "$output"
  else
    echo "${output%%/}"
  fi
}
