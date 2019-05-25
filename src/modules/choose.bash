# ---
# Category: Prompt
# Since: 0.1.0
# ---

choose() {
  local items=("$@")

  for i in "${!items[@]}"; do
    printf -- '- %s\t%s\n' $(("$i" + 1)) "${items[$i]}"
  done

  read -r -p "Please enter the number choose: " num

  if [[ $num -gt ${#items[@]} ]] || [[ $num -lt 1 ]]; then
   echo "Invalid choose number: $num" >&2
   return 2
  fi

  echo "${items[$((num - 1))]}"
}
