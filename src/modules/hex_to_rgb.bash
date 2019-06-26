# ---
# Category: Color
# Since: 0.1.0
# Usage: l.hex_to_rgb <HEX>
# Description: Return a list contains `<R> <G> <B>`.
# ---

# Reference: https://github.com/dylanaraps/pure-bash-bible#convert-a-hex-color-to-rgb
l.hex_to_rgb() {
  local hex r g b
  hex="${1/\#}"

  if (( ${#hex} == 6 )); then
    ((r=16#${hex:0:2},g=16#${hex:2:2},b=16#${hex:4:2})) || true
  elif (( ${#hex} == 3 )); then
    ((r=16#${hex:0:1}${hex:0:1},g=16#${hex:1:1}${hex:1:1},b=16#${hex:2:1}${hex:2:1})) || true
  else
    echo 'Argument is not a hex.' >&2
    return 3
  fi

  printf '%s\n%s\n%s\n' "$r" "$g" "$b"
}
