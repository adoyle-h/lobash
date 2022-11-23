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
When you use Lobash to build a library or framework, it is necessary to set PREFIX with unique namespace for avoiding naming collisions.

```sh
# The prefix defaults to "l.". Build Lobash with prefix "lobash_".
./build -p lobash_
```

The PREFIX only effect Lobash public functions and variables names.

If use Lobash in a command, it's unnecessary to change the PREFIX.

## Build Lobash with config file

`./build` will export all modules by default. You can export specific modules with `-c <config>` option.

```sh
cp config.example config

# Edit config, set PREFIX, BASH_MIN_VERSION and modules for building

./build -c ./config
```

## Build lobash in docker

```sh
# Default to BASHVER=4.1
./tools/build-build-image

# Build image with bash 4.4
BASHVER=4.4 ./tools/build-build-image

# Build image via proxy if you are in China
IN_CHINA=true ./tools/build-build-image
```

```sh
docker run -it --rm -v "`pwd`:/a" lobash/build:4.1 '/a/build /a/dist/'
```
