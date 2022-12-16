# ---
# Category: String
# Since: 0.6.0
# Usage: l.extract <opening_marker> <closing_marker> < "<file>"
# Usage: printf 'text\n' | l.extract <from> <to>
# Description: Extract strings between `<opening_marker>` and `<closing_marker>`.
# ---

l.extract() {
  local IFS=$'\n'
  local extract=false

  while read -r line; do
    [[ $extract == true ]] && [[ $line != "$2" ]] && printf '%s\n' "$line"
    [[ $line == "$1" ]] && extract=true
    [[ $line == "$2" ]] && extract=false
  done
}
