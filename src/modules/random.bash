# ---
# Category: Variable
# Since: 0.1.0
# Usage: l.random [<length>=10] [<pattern>=a-zA-Z0-9@#*=[]]
# Description: Return a random string in specific length. It must be a positive integer.
# Description: The `<pattern>` is allowed characters in range.
# Description: This function requires `dd` command available in system.
# ---

l.random() {
  local length=${1:-10}
  local pattern=${2:-a-zA-Z0-9@#*=[]}
  local result=''

  # This line does not work in Github Action. See https://github.com/orgs/community/discussions/39644
  # printf '%s\n' "$(LC_ALL=C tr -dc "$pattern" < /dev/urandom | head -c "$length" || true)"

  while (( ${#result} < length )); do
    result="$result$(dd bs=512 if=/dev/urandom count=1 2>/dev/null | LC_ALL=C tr -dc "$pattern" | head -c "$length" || true)"
  done

  echo "${result:0:$length}"
}
