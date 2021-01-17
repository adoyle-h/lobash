# Build

## Build Lobash for different Bash versions

```sh
# Interactive build process
./build
# Generated Lobash file: <lobash-dir>/dist/lobash.bash
```

```sh
# Or no-interactive build process, build for Bash 4.0+
BASHVER=4.0 ./build
```

## Build Lobash to specific path

```sh
./build /usr/local/lobash.bash
# Generated Lobash file: /usr/local/lobash.bash

./build /usr/local/
# Generated Lobash file: /usr/local/lobash.bash

./build /usr/local/l.bash
# Generated Lobash file: /usr/local/l.bash
```

## Build Lobash with different PREFIX

```sh
# Or build Lobash to specific path and change Lobash function prefix which defaults to "l."
PREFIX=lobash_ ./build <target-path>
```

When you use Lobash to build a library or framework, it is necessary to set `PREFIX` with unique namespace for avoiding naming collisions.
When you build a command, `PREFIX` is unnecessary.

The `PREFIX` only effect Lobash public functions and variables names.

## Build Lobash with config file

`./build` will export all modules by default. You can export specific modules with `-c <config>` option.

```sh
cp config.example config

# Edit config, set PREFIX, BASH_MIN_VERSION and modules for building

./build -c ./config
```
