# ---
# Category: Condition
# Since: 0.1.0
# Dependent: is_dir
# Usage: l.is_executable_file <path>
# Description: Similar to `l.is_executable`. But if `<path>` is directory it will return false.
# ---

l.is_executable_file() {
  local r
  r=$(l.is_dir "${1:-}")
  if [[ $r == true ]]; then
    # directory is executable
    # https://superuser.com/a/168583
    echo false
  else
    [[ -x $1 ]] && echo true || echo false
  fi
}
