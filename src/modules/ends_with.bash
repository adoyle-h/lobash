# ---
# Category: String
# Since: 0.1.0
# ---

ends_with() {
  if [[ ${1%%"$2"}$2 == "$1" ]]; then
    echo true
  else
    echo false
  fi
}
