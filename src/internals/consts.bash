# ---
# Dependent_Internal: detect_os
# ---

# Prevent multiple executions
[[ -n ${_LOBASH_INTERNAL_FUNC_PREFIX:-} ]] && return

readonly _LOBASH_INTERNAL_FUNC_PREFIX=_lobash.
readonly _LOBASH_INTERNAL_CONST_PREFIX=_lobash_
readonly _LOBASH_PRIVATE_FUNC_PREFIX=_l.
readonly _LOBASH_PRIVATE_CONST_PREFIX=_l_
readonly _LOBASH_PUBLIC_FUNC_PREFIX=l.
readonly _LOBASH_PUBLIC_CONST_PREFIX=l_
readonly _LOBASH_DEFAULT_PREFIX=l.

readonly _lobash_os=$(_lobash.detect_os)
