# ---
# Category: Prompt
# Since: 0.1.0
# Dependent: is_integer
# Usage: l.choose <item>...
# ---

l.choose() {
  local items=("$@")

  printf -- '  %s\n' 'No. Item' >/dev/tty
  local i
  for i in "${!items[@]}"; do
    printf -- '- %-2d  %s\n' $(("$i" + 1)) "${items[$i]}" >/dev/tty
  done

  read -r -p "Please enter the number to choose: " num

  local r
  r=$(l.is_integer "$num")
  [[ $r == false ]] && echo "Must enter an integer. Current: $num">&2 && return 3

  if [[ $num -gt ${#items[@]} ]] || [[ $num -lt 1 ]]; then
   printf '%s\n' "Invalid choose number: $num" >&2
   return 4
  fi

  printf '%s\n' "${items[$((num - 1))]}"
}
