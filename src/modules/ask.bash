# ---
# Category: Prompt
# Since: 0.1.0
# Usage: l.ask <message> [<default>=Y]
# Description: Print a message and read Yes/No answer from stdin.
# Description: It prints 'YES' when get answer y/Y/ye/Ye/yE/YE/yes/yES/yeS/YeS/Yes/YEs/YES.
# Description: It prints 'NO' when get answer n/N/no/No/nO/NO.
# Description: It prints default value when get empty answer.
# Description: It prints 'Invalid Answer' when get other answers.
# Description: When default=Y, if will return YES by default.
# Description: When default=N, if will return NO by default.
# Dependent: lower_case
# ---

_l.ask() {
  local msg=$1
  local default=${2:-Y}
  local check_answer=$3
}

_l.ask_with_cancel_checker() {
  local answer=$1
  if [[ $answer =~ ^ye?s?$ ]]; then
    echo YES
  elif [[ $answer =~ ^no?$ ]]; then
    echo NO
  elif [[ $answer =~ ^cancel?$ ]]; then
    echo CANCEL
  elif [[ $answer == '' ]]; then
    echo "$default"
  else
    [[ -c /dev/tty ]] && echo "Invalid Answer '$answer'. Try to type 'yes', 'no' or 'cancel'." > /dev/tty
    l.ask "$msg" "${default:0:1}"
  fi
}

_l.ask_checker() {
  local answer=$1
  if [[ $answer =~ ^ye?s?$ ]]; then
    echo YES
  elif [[ $answer =~ ^no?$ ]]; then
    echo NO
  elif [[ $answer == '' ]]; then
    echo "$default"
  else
    [[ -c /dev/tty ]] && echo "Invalid Answer '$answer'. Try to type 'yes', 'no'." > /dev/tty
    l.ask "$msg" "${default:0:1}"
  fi
}

l.ask_with_cancel() {
  _l.ask "$1" "$2" _l.ask_with_cancel_checker
}

_l.ask() {
  local msg=$1
  local default=${2:-Y}
  local check_answer=$3

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

  local answer
  read -rp "$msg $prompt " answer

  answer=$(l.lower_case "$answer")
  check_answer "$answer"

  if [[ $answer =~ ^ye?s?$ ]]; then
    echo YES
  elif [[ $answer =~ ^no?$ ]]; then
    echo NO
  elif [[ $answer == '' ]]; then
    echo "$default"
  else
    [[ -c /dev/tty ]] && echo "Invalid Answer '$answer'. Try to type 'yes', 'no' or 'cancel'." > /dev/tty
    l.ask "$msg" "${default:0:1}"
  fi

  return 0
}
