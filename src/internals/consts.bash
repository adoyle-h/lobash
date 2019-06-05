# Prevent multiple executions
[[ -n ${__LOBASH_CONST_LOADED:-} ]] && return

readonly _LOBASH_INTERNAL_FUNC_PREFIX=_lobash_
readonly _LOBASH_PRIVATE_FUNC_PREFIX=_l.
readonly _LOBASH_PUBLIC_FUNC_PREFIX=l.
readonly _LOBASH_DEFAULT_PREFIX=l.

readonly _LOBASH_IMPORT_ENTRIES=(
  import
  import_category
  import_all
)

# Put this line at last
readonly __LOBASH_CONST_LOADED=true
