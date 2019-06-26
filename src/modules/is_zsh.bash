# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_zsh
# Description: Return `true` or `false`.
# ---

l.is_zsh() {
  [[ -n "${ZSH_VERSION:-}" ]] && echo true || echo false
}
