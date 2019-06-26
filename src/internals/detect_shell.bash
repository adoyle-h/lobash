_lobash.detect_shell() {
  if [[ -n ${BASH_VERSION:-} ]]; then
    echo Bash
  elif [[ -n ${ZSH_VERSION:-} ]]; then
    echo Zsh
  else
    echo 'Unknown Shell'
  fi
}
