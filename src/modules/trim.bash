# ---
# Category: String
# Since: 0.1.0
# Dependent: trim_start, trim_end
# Usage: l.trim <string>
# Usage: echo <string> | l.trim
# ---

l.trim() {
  if [[ -t 0 ]]; then
    l.trim_start "${1:-}" | l.trim_end
  else
    read -r str
    l.trim_start <<< "$str" | l.trim_end
  fi
}
