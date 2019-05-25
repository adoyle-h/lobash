__src_dir="$(dirname "${BASH_SOURCE[0]}")"
__prefix=${2:-}

if [[ -z $__prefix ]]; then
  source "$__src_dir"/modules/import.bash
  source "$__src_dir"/modules/import_all.bash
else
  source <( cat "$__src_dir"/modules/import.bash | sed -E "s/^([A-Za-z0-9]\\w*)\\(\\) ?\\{$/${__prefix}\\1\\(\\) \\{/" )
  source <( cat "$__src_dir"/modules/import_all.bash | sed -E "s/^([A-Za-z0-9]\\w*)\\(\\) ?\\{$/${__prefix}\\1\\(\\) \\{/" )
fi

unset __src_dir __prefix
