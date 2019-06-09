# ---
# Category: Debug
# Since: 0.1.0
# Usage: l.trace_start [PS4_level=1] [label]
# Arguments: PS4_level 1,2,3
# ---
# shellcheck disable=SC2034

l.trace_start() {
  _l_trace_start_old_ps4=$PS4
  local label=${2:-}
  [[ -n "$label" ]] && label="[$label]"

  case ${1:-1} in
    1 )
      PS4='+'${label}'[${LINENO}|${FUNCNAME[0]:+${FUNCNAME[0]}}()|$?${XTRACE_PIPE:+|${PIPESTATUS[*]}}]: '
      ;;
    2 )
      PS4='+'${label}'[$(basename ${BASH_SOURCE[0]}):${LINENO}|${FUNCNAME[0]:+${FUNCNAME[0]}}()|$?${XTRACE_PIPE:+|${PIPESTATUS[*]}}]: '
      ;;
    3 )
      PS4='+'${label}'[${BASH_SOURCE[0]}:${LINENO}|${FUNCNAME[0]:+${FUNCNAME[0]}}()|$?${XTRACE_PIPE:+|${PIPESTATUS[*]}}]: '
      ;;
    * )
      echo "Invalid PS4_LEVEL: $1" >&2
      return 3
      ;;
  esac

  set -o xtrace
}
