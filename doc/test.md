# Test

## TOC

<!-- MarkdownTOC GFM -->

- [Test with your default Bash in local](#test-with-your-default-bash-in-local)
- [Test with different Bash versions in local](#test-with-different-bash-versions-in-local)
- [Test with different Bash versions in Docker](#test-with-different-bash-versions-in-docker)
- [Build Docker images for testing](#build-docker-images-for-testing)
- [Test with different Bash versions in Docker](#test-with-different-bash-versions-in-docker-1)
- [Import specific modules for testing](#import-specific-modules-for-testing)
- [Debug](#debug)

<!-- /MarkdownTOC -->

## Test with your default Bash in local

```sh
# Run all test cases with Lobash source codes in local
./test

# Run specific test cases with Lobash source codes in local
./test ./tests/modules/${module_name}.bats

# Build Lobash and run all test cases with Lobash dist in local
./build ./dist && ./test -d

# Build Lobash and run specific test cases with Lobash dist in local
./build ./dist && ./test ./tests/modules/${module_name}.bats
```

## Test with different Bash versions in local

```sh
BASHVER=4.0 ./tools/test-in-docker
# or
BASHVER=4.0 ./tools/test-in-docker ./tests/modules/${module_name}.bats
```

## Test with different Bash versions in Docker

```sh
# Default BASHVER=4.4
./tools/test-in-docker

# Build Lobash for Bash 4.0+, test with Lobash source codes in docker with Bash 4.0
BASHVER=4.0 ./tools/test-in-docker

# Build Lobash for Bash 4.0+, test with Lobash source codes in docker with Bash 4.0
BASHVER=4.0 ./tools/test-in-docker ./tests/modules/${module_name}.bats

# Add IN_CHINA=true if you are in China
IN_CHINA=true BASHVER=4.0 ./tools/test-in-docker

# Build Lobash for Bash 4.0+, test Lobash dist in docker with Bash 4.0
BASHVER=4.0 BUILD_DIST=true ./tools/test-in-docker

# Build Lobash for Bash 4.0+, test Lobash dist in docker with Bash 4.0
BASHVER=4.0 BUILD_DIST=true ./tools/test-in-docker ./tests/modules/${module_name}.bats
```

## Build Docker images for testing

```sh
# Default to BASHVER=4.4
./tools/build-test-image

# Build image with bash 4.0
BASHVER=4.0 ./tools/build-test-image

# Build image via proxy if you are in China
IN_CHINA=true ./tools/build-test-image

# Build all bash versions
./tools/build-test-images
# or
IN_CHINA=true ./tools/build-test-images
```

## Test with different Bash versions in Docker

```sh
BASHVER=4.0 ./tools/run-in-docker
# Then you will get into the Bash 4.0 container
```

## Import specific modules for testing

```sh
source ./src/load_internals.bash
_lobash.import_internals basic_meta_types module_meta
_lobash.imports ask first last

l.ask hello world
l.first a b c
l.last a b c
```

## Debug

Set environment variable `LOBASH_DEBUG=true` to print verbose logs.
