# ---
# Category: Array
# Since: 0.6.0
# Usage: l.read_array <array_name> < <(printf 'a\nb\nc\n')
# Description: Read array from pipeline (Each item must be split with `\n`). The results store in `<array_name>`.
# Notice: Do not use `printf 'a\nb\nc\n' | l.read_array <name>`. See [this link](https://superuser.com/a/1348950) for reason.
# ---

if (( BASH_VERSINFO[0] == 4 )) && (( BASH_VERSINFO[1] < 4 )); then
  l.read_array() {
    IFS=$'\n' readarray -t "$1"
  }
else
  l.read_array() {
    readarray -d $'\n' -t "$1"
  }
fi
