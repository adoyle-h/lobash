# ---
# Category: String
# Since: 0.1.0
# ---

trim_end() {
  echo "${1%"${1##*[![:space:]]}"}"
}
