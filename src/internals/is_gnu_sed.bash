_lobash.is_gnu_sed() {
  local out
  out=$(${1:-sed} --version 2>/dev/null)
  [[ $out =~ 'GNU sed' ]]
}
