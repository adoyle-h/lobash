# ---
# Category: Variable
# Since: 0.1.0
# Usage: l.real_path
# Description: Return the directory path of current file where the l.cur_dir_path called in.
# ---

l.real_path() {
  local target=${1:-$0}
  local dir
  if [[ -d $target ]]; then
    dir=$target
  else
    dir=$(dirname -- "$target")
  fi
  ( cd -P -- "$dir" && pwd -P )
  # while do
  # done
}
