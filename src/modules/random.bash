# ---
# Category: Util
# Since: 0.1.0
# Usage: l.random [<length>=10] [<pattern>=a-zA-Z0-9@#*=[]]
# Description: Return a random string in specific length.
# Description: The <pattern> is allowed characters in range.
# ---

l.random() {
  local length=${1:-10}
  local pattern=${2:-a-zA-Z0-9@#*=[]}
  printf '%\n' "$(LC_CTYPE=C tr -dc "$pattern" < /dev/urandom | head -c "$length")"
}
