# ---
# Category: Network
# Since: 0.5.0
# Usage: l.unused_port [port_start=1024] [port_end=49151] [<host>=127.0.0.1]
# Description:
# ---

l.unused_port() {
  local port_start=${1:-1024}
  local port_end=${1:-49151}
  local host=${3:-127.0.0.1}
  local result port
  for port in $(seq "$port_start" "$port_end"); do
    result=$(gtimeout "${TIMEOUT_SECONDS:-2}" bash -c "</dev/tcp/${host}/${port}" &>/dev/null; echo $?)
    [[ $result != 0 ]] && echo "$port" && break
  done
}
