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

## Build different Bash versions

```sh
BASHVER=4.0 ./tools/build-test-image
```

## Test with different Bash versions

```sh
BASHVER=4.0 ./tools/test-in-docker
# or
BASHVER=4.0 ./tools/test-in-docker ./tests/modules/${module_name}.bats
# or
BASHVER=4.0 ./tools/test-in-docker -d
# or
BASHVER=4.0 ./tools/test-in-docker -d ./tests/modules/${module_name}.bats
```

## Run in different Bash versions

```sh
BASHVER=4.0 ./tools/run-in-docker
```
