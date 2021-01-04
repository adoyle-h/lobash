# ---
# Category: Condition
# Since: next-minor
# Usage: l.is_ubuntu
# Description: Detect whether current os is Ubuntu or not.
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_ubuntu() {
  if [[ -e /etc/os-release ]]; then
    local dist=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
    if [[ $dist == '"Ubuntu"' ]]; then
      return 0
    fi
  fi

  return 1
}
