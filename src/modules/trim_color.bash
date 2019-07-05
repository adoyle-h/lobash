# ---
# Category: String
# Since: 0.1.0
# Usage: l.trim_color <string>
# Description: Remove color escape code in string
# Description: \u001b not work in Bash <4.2. [[ $'\e' == $'\u001b' ]] is false in Bash <4.2
# Bash: 4.2
# ---

l.trim_color() {
  local ecs=$'\e'
  local str="$1"

  if [[ $_LOBASH_OS == Linux ]]; then
    sed -E "s,${ecs}[[0-9]*(;[0-9]+)*m,,g" <<< "$str"
  elif [[ $_LOBASH_OS == MacOS ]] || [[ $_LOBASH_OS == BSD ]]; then
    sed -E "s,\\${ecs}[[0-9]*(;[0-9]+)*m,,g" <<< "$str"
  else
    echo "Unexpected _LOBASH_OS=$_LOBASH_OS" >&2
    return 5
  fi
}
