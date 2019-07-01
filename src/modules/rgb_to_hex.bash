# ---
# Category: Color
# Since: 0.1.0
# Usage: l.rgb_to_hex <R> <G> <B>
# Dependent: is_number
# Description: Return hex string. Like '#ffffff'
# ---

# Reference: https://github.com/dylanaraps/pure-bash-bible#convert-an-rgb-color-to-hex
l.rgb_to_hex() {
  if (( $# != 3 )); then
    echo 'The arguments size not equal 3' >&2
    return 3
  fi

  if [[ $(l.is_number "$1") == false ]]; then
    echo 'The first argument is not a number' >&2
    return 4
  fi

  if [[ $(l.is_number "$2") == false ]]; then
    echo 'The second argument is not a number' >&2
    return 5
  fi

  if [[ $(l.is_number "$3") == false ]]; then
    echo 'The third argument is not a number' >&2
    return 6
  fi

  printf '#%02x%02x%02x\n' "$1" "$2" "$3"
}
