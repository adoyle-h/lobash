# ---
# Category: Util
# Since: 0.1.0
# Usage: l.compose [<function_name_or_string>]...
# Description: Function composition
# ---

l.compose() {
  local -a last=()
  for f in "$@"; do
    if [[ $(type -t "$f") == function ]]; then
      if (( ${#last[@]} > 0 )); then
        last=( "$($f "${last[@]}")" )
      else
        last=( "$($f)" )
      fi
    else
      last=( "$f" )
    fi
  done
  printf '%s\n' "${last[@]:-}"
}
