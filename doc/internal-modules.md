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
