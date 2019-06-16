# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_bash
# ---

l.is_bash() {
  [[ -n "$BASH_VERSION" ]] && echo true || echo false
}
