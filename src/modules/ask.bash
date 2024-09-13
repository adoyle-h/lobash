# ---
# Category: Prompt
# Since: 0.1.0
# Usage: l.ask <message> [<default>='']
# Description: Print the message to tty and wait for user typing from stdin.
# Description: It will print 'YES' when user types y/Y/ye/Ye/yE/YE/yes/yES/yeS/YeS/Yes/YEs/YES.
# Description: It will print 'NO' when user types n/N/no/No/nO/NO.
# Description: It will print the default value when get empty answer if default is not empty.
# Description: When default=Y, it prints 'YES' by default.
# Description: When default=N, it prints 'NO' by default.
# Description: When default='', there is no default value. It will keep asking until user typed right answer.
# Description: **Attention: "echo invalid_string | l.ask message" will fall into a infinite loop.**
# Description: "echo y | l.ask message" and "echo n | l.ask message" are valid.
# Dependent: start_with, join
# ---

# The _l.ask() is used by l.ask and l.ask_with_cancel
_l.ask() {
  local msg=$1
  local default=$2
  local valid_values prompt
  valid_values="$(l.join values /)"

  if [[ $default == Y ]]; then
    default=yes
    prompt="[$valid_values (default ${default})]"
  elif [[ $default == N ]]; then
    default=no
    prompt="[$valid_values (default ${default})]"
  elif [[ $default == '' ]]; then
    prompt="[$valid_values]"
  else
    echo "Invalid argument 'default'. Valid value is $valid_values. Current=${default}" >&2
    return 3
  fi

  local answer result='' tty_available
  tty_available=$(_lobash.is_tty_available && echo true || echo false)
  [[ $tty_available == true ]] && echo "$msg" >/dev/tty

  local loop_limit=10

  while [[ -z $result ]]; do
    read -rp "$prompt " answer

    if [[ -z $answer ]]; then
      if [[ -z $default ]]; then
        [[ $tty_available == true ]] && echo ">> Empty answer is not allowed." >/dev/tty
      else
        result="${default^^}"
      fi
    else
      local v
      for v in "${values[@]}"; do
        if l.start_with "$v" "${answer,,}"; then
          result="${v^^}"
          break
        fi
      done

      if [[ -z $result ]]; then
        [[ $tty_available == true ]] && echo ">> Invalid answer '$answer'." >/dev/tty
      fi
    fi

    loop_limit=$((loop_limit - 1))
    if ((loop_limit == 0)); then
      [[ $tty_available == true ]] && echo ">> Error: Reach the loop limit while asking" >/dev/tty
      return 4
    fi
  done
  echo "$result"
}

l.ask() {
  local values=(yes no)
  _l.ask "$1" "${2:-}"
}
