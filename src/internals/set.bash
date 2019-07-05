_lobash.set() {
  local module=$1
  local option=$2
  read -r "_LOBASH_SETTING_${module}_${option}" <<< "$3"
}
