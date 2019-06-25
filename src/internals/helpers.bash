_lobash.prefix() {
  printf '%s\n' "$_LOBASH_PREFIX"
}

_lobash.public_funcs() {
  compgen -A function "$_LOBASH_PUBLIC_FUNC_PREFIX"
}

_lobash.private_funcs() {
  compgen -A function "$_LOBASH_PRIVATE_FUNC_PREFIX"
}

_lobash.internal_funcs() {
  compgen -A function "$_LOBASH_INTERNAL_FUNC_PREFIX"
}

_lobash.public_consts() {
  compgen -A variable "$_LOBASH_PUBLIC_CONST_PREFIX"
}

_lobash.private_consts() {
  compgen -A variable "$_LOBASH_PRIVATE_CONST_PREFIX"
}

_lobash.internal_consts() {
  compgen -A variable "$_LOBASH_INTERNAL_CONST_PREFIX"
}
