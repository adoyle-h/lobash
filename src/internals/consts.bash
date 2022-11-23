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

# _LOBASH_PREFIX, _LOBASH_PUBLIC_DEPTH, _LOBASH_MIN_BASHVER will be reassigned when ./build
readonly _LOBASH_PREFIX=l.
_LOBASH_PUBLIC_DEPTH=1  # NOTE: _LOBASH_PUBLIC_DEPTH should not be readonly
readonly _LOBASH_MIN_BASHVER=4.0

readonly _LOBASH_OS=$(_lobash.detect_os)
