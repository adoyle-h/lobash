_lobash.rm() {
  local path=$1
  if [[ $path == / ]]; then
    echo "Dangerous! Do not rm $path"
    return 3
  fi

  if [[ $(dirname "$path") == / ]]; then
    echo "Dangerous! Do not rm $path"
    return 3
  fi

  rm -rf -- "$path"
}
