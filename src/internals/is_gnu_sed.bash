_lobash.is_gnu_sed() {
  sed --version 2>/dev/null | grep 'GNU sed' >/dev/null
}
