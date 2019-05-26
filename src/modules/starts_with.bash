# ---
# Category: String
# Since: 0.1.0
# ---

starts_with() {
  if [[ $2${1##"$2"} == "$1" ]]; then
    echo true
  else
    echo false
  fi
}
