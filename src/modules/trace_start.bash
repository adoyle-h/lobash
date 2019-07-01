# ---
# Category: Debug
# Since: 0.1.0
# Usage: l.trace_start [<PS4_level>=2] [<label>]
# Description: PS4_level  Valid Values: `1`, `2`, `3`. Different level changes different prompt message format.
# Description: Open xtrace mode and set PS4. It will print each script line with nice prompt for debug.
# ---
# shellcheck disable=SC2034

l.trace_start() {
  declare -g _L_TRACE_OLD_PS4=$PS4
  local label=${2:-}
  [[ -n "$label" ]] && label="[$label]"

  case ${1:-2} in
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
