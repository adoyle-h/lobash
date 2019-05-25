# ---
# Category: String
# Since: 0.1.0
# Dependent: trim_start, trim_end
# ---

trim() {
  trim_end "$(trim_start "$1")"
}
