# ---
# Category: String
# Since: 0.1.0
# ---

trim_start() {
  echo "${1#"${1%%[![:space:]]*}"}"
}
