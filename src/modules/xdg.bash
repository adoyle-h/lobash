# ---
# Category: System
# Since: 0.1.0
# ---

l.get_xdg_config_home() {
  printf '%s\n' "${XDG_CONFIG_HOME:-${HOME}/.config}"
}
