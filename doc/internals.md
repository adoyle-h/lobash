# Internals

Internal functions must starts with `_lobash_`. Like that,

```sh
_lobash_dirname() {
  printf '%s\n' "${1%/*}/"
}
```

or create files under `./src/internals/`.

```sh
dirname() {
  printf '%s\n' "${1%/*}/"
}
```

Use `_lobash_import_internals` to load internal functions.

`_lobash_import_internals dirname` will load the file `./src/internals/dirname.bash` and set a function `_lobash_dirname`.
