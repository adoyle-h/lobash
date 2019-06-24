# ---
# Category: String
# Since: 0.1.0
# Usage: l.trim_color <string>
# Usage: echo <string> | l.trim_color
# Description: Remove color escape code in string
# ---

l.trim_color() {
  local ecs=$'\e'
  local str

  if [[ -t 0 ]]; then
    str="$1"
  else
    read -r str
  fi

  if [[ $_lobash_os == Linux ]]; then
    sed -E "s,${ecs}[[0-9]*(;[0-9]+)*m,,g" <<< "$str"
  elif [[ $_lobash_os == MacOS ]] || [[ $_lobash_os == BSD ]]; then
    sed -E "s,\\${ecs}[[0-9]*(;[0-9]+)*m,,g" <<< "$str"
  else
    echo "Only MacOS/BSD/Linux systems are valid." >&2
    return 5
  fi
}
