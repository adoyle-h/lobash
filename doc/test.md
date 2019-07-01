# Test

Run `./test ./tests/modules/${module_name}.bats` to test specific module while local development.

Run `./tools/test-in-docker` or `./build && ./test -d` for complete testing.

## Import specific modules for testing

```sh
source ./src/load_internals.bash
_lobash.import_internals module_meta
_lobash.imports ask first last

l.ask hello world
l.first a b c
l.last a b c
```

## Debug

Set environment variable `LOBASH_DEBUG=true` to print verbose logs.
