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

  sed -E "s,${ecs}[[0-9]*(;[0-9]+)*m,,g" <<< "$str"
}
