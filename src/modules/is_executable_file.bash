# ---
# Category: Condition
# Since: 0.3.0
# Dependent: is_dir
# Usage: l.is_executable_file <path>
# Description: Similar to `l.is_executable`. But if `<path>` is directory it will return false.
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_executable_file() {
  [[ -z ${1:-} ]] && return 1

  if l.is_dir "$1"; then
    # directory is executable
    # https://superuser.com/a/168583
    return 1
  else
    [[ -x $1 ]]
  fi
}
