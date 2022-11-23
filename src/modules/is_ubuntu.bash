# ---
# Category: Condition
# Since: 0.5.0
# Usage: l.is_ubuntu
# Description: Detect whether current os is Ubuntu or not.
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_ubuntu() {
  if [[ -f /etc/os-release ]]; then
    grep '^NAME="Ubuntu"' </etc/os-release &>/dev/null
  else
    return 1
  fi
}
