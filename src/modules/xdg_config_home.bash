# ---
# Category: System
# Since: 0.1.0
# Usage: l.xdg_config_home
# Description: Return XDG_CONFIG_HOME. Return `${HOME}/.config` if XDG_CONFIG_HOME not set.
# ---

l.xdg_config_home() {
  printf '%s\n' "${XDG_CONFIG_HOME:-${HOME}/.config}"
}
