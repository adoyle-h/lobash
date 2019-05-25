get_xdg_config_home() {
  echo "${XDG_CONFIG_HOME:-${HOME}/.config}"
}
