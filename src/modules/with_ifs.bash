# ---
# Category: Util
# Since: 0.2.0
# Usage: l.with_IFS <IFS> <command_string>
# Description: run `<command_string>` with `<IFS>` effects
# ---

l.with_ifs() {
  _lobash.with_IFS "$@"
}
