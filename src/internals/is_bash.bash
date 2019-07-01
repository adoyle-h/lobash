_lobash.is_bash() {
  [[ -n "${BASH_VERSION:-}" ]] && echo true || echo false
}
