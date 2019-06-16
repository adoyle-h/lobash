# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_zsh
# ---

l.is_zsh() {
  [[ -n "$ZSH_VERSION" ]] && echo true || echo false
}
