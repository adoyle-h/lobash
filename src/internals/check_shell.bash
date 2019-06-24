_lobash.get_shell_type() {
  if [[ -n ${BASH_VERSION:-} ]]; then
    echo bash
  elif [[ -n ${ZSH_VERSION:-} ]]; then
    echo zsh
  else
    echo 'Lobash only work in Bash and Zsh.' >&2
    return 5
  fi
}

_lobash.check_shell() {
  if [[ -z ${BASH_VERSION:-} ]] && [[ -z ${ZSH_VERSION:-} ]]; then
    echo 'Lobash only work in Bash and Zsh.' >&2
    return 5
  fi
}

_lobash.check_shell
