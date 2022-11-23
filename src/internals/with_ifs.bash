# Usage: _lobash.with_IFS <IFS> <command_string>
# Description: run `<command_string>` with `<IFS>` effects
_lobash.with_IFS() {
  local IFS=$1
  shift
  eval "$*"
}
