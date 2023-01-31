_lobash.rm() {
  local path=$1

  if [[ -z "$path" ]]; then
    echo "Cannot remove path which is empty." >&2
    return 3
  fi

  local forbidden_chars=( '//' '../' './' '*' '"' "'" ' ' )
  local pattern
  for pattern in "${forbidden_chars[@]}"; do
    if [[ $path =~ $pattern ]]; then
      printf 'Cannot remove path "%s", which contains "%s".\n' "$path" "$pattern" >&2
      return 4
    fi
  done

  # L_PROTECTED_PATHS defined in config
  for pattern in "${L_PROTECTED_PATHS[@]}"; do
    if [[ $path == "$pattern" ]]; then
      printf 'Cannot remove path "%s", which is under protected.\n' "$path" >&2
      return 5
    fi
  done

  rm -rf -- "$path"
}
