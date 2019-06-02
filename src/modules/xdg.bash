# ---
# Category: System
# Since: 0.1.0
# Usage: l.get_xdg_config_home
# ---

l.get_xdg_config_home() {
  printf '%s\n' "${XDG_CONFIG_HOME:-${HOME}/.config}"
}
