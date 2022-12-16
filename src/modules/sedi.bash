# ---
# Category: Util
# Since: 0.6.0
# Usage: l.sedi <sed-command>... <file>
# Description: Wrap "sed -i". Compatible with GNU sed and BSD sed.
# Description: The usage refer to `man sed`.
# ---

if _lobash.is_gnu_sed; then
  l.sedi() { sed -i'' "$@"; }
else
  l.sedi() { sed -i '' "$@"; }
fi
