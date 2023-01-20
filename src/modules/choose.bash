# ---
# Category: Prompt
# Since: 0.1.0
# Usage: l.choose <item>...
# Description: Prompt user to choose one item from options. The function will return the value of chosen item.
# ---

_l.choose_prompt() {
  printf '  %s\n' 'No. Item'
  local i
  for i in "${!items[@]}"; do
    printf -- '- %-2d  %s\n' $((i + 1)) "${items[$i]}"
  done

  printf 'Please enter the number to choose: \n'
}

l.choose() {
  local items=("$@")

  local num prompt
  prompt=$(_l.choose_prompt)
  read -r -p "$prompt" num

  if ! [[ ${num} =~ ^[0-9]+$ ]]; then
    echo "Must enter an integer. Current: $num">&2
    return 3
  fi

  if [[ $num -gt ${#items[@]} ]] || [[ $num -lt 1 ]]; then
    printf '%s\n' "Invalid choose number: $num" >&2
    return 4
  fi

  printf '%s\n' "${items[$((num - 1))]}"
}
