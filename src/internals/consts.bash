# Prevent multiple executions
[[ -v __LOBASH_CONST_LOADED ]] && return

readonly _LOBASH_METADATA_MAX_LINES=10
readonly _LOBASH_INTERNAL_FUNC_PREFIX=_lobash_in_
readonly _LOBASH_PRIVATE_FUNC_PREFIX=_lobash
readonly _LOBASH_PUBLIC_FUNC_PREFIX=l.
readonly _LOBASH_DEFAULT_PREFIX=l.

readonly _LOBASH_IMPORT_ENTRIES=(
  import
  import_by_category
  import_all
)

# Put this line at last
readonly __LOBASH_CONST_LOADED=true
