# ---
# Category: Prompt
# Since: 0.1.0
# Usage: l.choose <option1> <option2> [...optionN]
# ---

l.choose() {
  local items=("$@")

  local i
  for i in "${!items[@]}"; do
    printf -- '- %s\t%s\n' $(("$i" + 1)) "${items[$i]}"
  done

  read -r -p "Please enter the number choose: " num

  if [[ $num -gt ${#items[@]} ]] || [[ $num -lt 1 ]]; then
   printf '%s\n' "Invalid choose number: $num" >&2
   return 2
  fi

  printf '%s\n' "${items[$((num - 1))]}"
}
