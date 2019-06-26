# ---
# Category: String
# Since: 0.1.0
# Usage: l.trim_color <string>
# Description: Remove color escape code in string
# ---

l.trim_color() {
  local ecs=$'\e'
  local str="$1"

  if [[ $_LOBASH_OS == Linux ]]; then
    sed -E "s,${ecs}[[0-9]*(;[0-9]+)*m,,g" <<< "$str"
  elif [[ $_LOBASH_OS == MacOS ]] || [[ $_LOBASH_OS == BSD ]]; then
    sed -E "s,\\${ecs}[[0-9]*(;[0-9]+)*m,,g" <<< "$str"
  else
    echo "The trim_color function is supported only in MacOS/BSD/Linux systems." >&2
    return 5
  fi
}
