_lobash.check_os() {
  if [[ ! $_LOBASH_OS =~ ^(Linux|MacOS|BSD)$ ]]; then
    echo "Not support current system: $_LOBASH_OS" >&2
    return 5
  fi
}

_lobash.check_shell() {
  if [[ $(_lobash.is_bash) == false ]]; then
    echo 'Lobash only work in Bash.' >&2
    return 6
  fi
}

_lobash.check_supported_bash_version() {
  if [[ ${BASH_VERSINFO[0]} -lt 4 ]] \
    || ([[ ${BASH_VERSINFO[0]} == 4 ]] && [[ ${BASH_VERSINFO[1]} -lt 4 ]]); then
    echo "Bash $BASH_VERSION is not supported. Upgrade your Bash to 4.4 or higher version." >&2
    return 7
  fi
}

_lobash.check_support() {
  _lobash.check_os
  _lobash.check_shell
  _lobash.check_supported_bash_version
}

_lobash.check_support
