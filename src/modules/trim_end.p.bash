# ---
# Category: String
# Since: 0.1.0
# Usage: echo <string> | l.trim_end.p [chars=[[:space:]]]
# Description: The pipeline version l.trim_end
# Dependent: trim_end
# ---

l.trim_end.p() {
  local str
  IFS='' read -r str

  l.trim_end "$str" "$@"
}
