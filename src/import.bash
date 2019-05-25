__src_dir="$(dirname "${BASH_SOURCE[0]}")"
__prefix=${2:-}

if [[ -z $__prefix ]]; then
  source "$__src_dir"/modules/import.bash
else
  source <( cat "$__src_dir"/modules/import.bash | sed -E "s/^([A-Za-z0-9]\\w*)\\(\\) ?\\{/${__prefix}\\1\\(\\) \\{/g" )
fi

unset __src_dir __prefix
