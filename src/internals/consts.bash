# ---
# Dependent_Internal: detect_os
# ---

# shellcheck disable=SC2034

# Prevent multiple executions
[[ -n ${_LOBASH_INTERNAL_FUNC_PREFIX:-} ]] && return

readonly _LOBASH_INTERNAL_FUNC_PREFIX=_lobash.
readonly _LOBASH_INTERNAL_CONST_PREFIX=_LOBASH_
readonly _LOBASH_PRIVATE_FUNC_PREFIX=_l.
readonly _LOBASH_PRIVATE_CONST_PREFIX=_L_
readonly _LOBASH_PUBLIC_FUNC_PREFIX=l.
readonly _LOBASH_PUBLIC_CONST_PREFIX=L_
readonly _LOBASH_PREFIX=l.

readonly _LOBASH_OS=$(_lobash.detect_os)
