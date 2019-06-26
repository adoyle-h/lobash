_lobash.check_shell() {
  if [[ -z ${BASH_VERSION:-} ]] && [[ -z ${ZSH_VERSION:-} ]]; then
    echo 'Lobash only work in Bash and Zsh.' >&2
    return 5
  fi
}

_lobash.check_os() {
  if [[ $_LOBASH_OS != 'Linux' ]] && [[ $_LOBASH_OS != 'MacOS' ]] && [[ $_LOBASH_OS != 'BSD' ]]; then
    echo "Not support current system: $_LOBASH_OS" >&2
    return 6
  fi
}

_lobash.check_shell
_lobash.check_os
