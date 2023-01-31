# Internal Modules

The internal modules must put in `src/internals/` folder.

## Internal Functions

Internal functions must starts with `_lobash.`. Like that,

```sh
_lobash.dirname() {
  printf '%s\n' "${1%/*}/"
}
```

## Use internal modules

Invoke `source ./src/load_internals.bash` to load basic internal modules first.
And use `_lobash.import_internal` to import internal modules.

**Attention**: When invoke `source ./src/load_internals.bash` in a function scope not global scope,
some internal functions will be wrong. Because `_LOBASH_MOD_META_CACHE` variable must be in global scope.

`LOBASH_MOD_META_CACHE` is used by internals/module_meta.bash.
`declare -A LOBASH_MOD_META_CACHE` before `_lobash.import_internals module_meta`.

`declare -g` can solve this problem, but it is not supported in Bash 4.1 and lower version.

## Add new internal modules

1. Create file in `src/internals/name.bash`
2. Edit `src/internals/basic_internals.bash`
  1. Append internal module name into `_LOBASH_BASIC_INTERNALS`
  2. (Optional) Append internal module name into `_LOBASH_DIST_INTERNALS`
