# ---
# Category: Prompt
# Since: 0.1.0
# Usage: l.ask <message> [<default>=Y]
# Description: Print a message and read Yes/No answer from stdin.
# Description: when default=Y, if will return YES by default.
# Description: when default=N, if will return NO by default.
# ---

l.ask() {
  local msg=$1
  local default=${2:-Y}
  local prompt
  if [[ $default == Y ]]; then
    default=YES
    prompt='([Y]es/No)'
  elif [[ $default == N ]]; then
    default=NO
    prompt='(Yes/[N]o)'
  else
    echo "Invalid argument 'default'. Valid value is 'Y' and 'N'. Current=${default}" >&2
    return 3
  fi

  read -rp "$msg $prompt " answer
  case $answer in
    [Yy]* )
      echo YES
      ;;
    [Nn]* )
      echo NO
      ;;
    '')
      echo "$default"
      ;;
    *)
      echo Invalid Answer
      ;;
  esac

  return 0
}
