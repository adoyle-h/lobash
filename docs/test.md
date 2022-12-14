# Test

## Run Test

### Test with your default Bash in local

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

### Test with different Bash versions in local

```sh
BASHVER=4.0 ./tools/test
# ./tools/test has same parameters to ./test
BASHVER=4.0 ./tools/test -d
BASHVER=4.0 ./tools/test ./tests/modules/${module_name}.bats
```

### Test with different Bash versions in Docker

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
BASHVER=4.0 ./tools/test-in-docker -d

# Build Lobash for Bash 4.0+, test Lobash dist in docker with Bash 4.0
BASHVER=4.0 ./tools/test-in-docker -d ./tests/modules/${module_name}.bats
```

## Build docker images for testing

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

## Run interactive shell in test container

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

## Writing Test Cases

### Filepath

For test files in `src/modules/<name>.bash`, create `tests/modules/<name>.bats`. The filename must be same.

For test files in `src/internals/<name>.bash`, create `tests/internals/<name>.bats`. The filename must be same.

### Template

```sh
#!/usr/bin/env bats

setup_fixture

@test "test case description" {
  run echo 1
  assert_success
  assert_equal ${#lines[@]} 1
  assert_line -n 0 1
}
```

Please read https://bats-core.readthedocs.io/en/stable/writing-tests.html

### Asserts

This project provides these assert libraries:

- [bats-assert](https://github.com/adoyle-h/bats-assert.git)
- [bats-file](https://github.com/bats-core/bats-file.git)

And other additional functions:

- `assert_array <actual_array_name> <expected_array_name>`. Read the [source code](../tests/fixture/asserts.bash).
- `assert_output_text "text"`
- `assert_output_text <<EOF text EOF`

### setup_fixture

You must invoke `setup_fixture` in .bats file. It will load the file [tests/fixture/setup.bash](../tests/fixture/setup.bash).

It will do below things,

- Auto load test module.
- Check current bash version. If current test module do not support current bash version, it will skip test cases.

### _setup_file

Due to the `setup_file` function is defined in tests/fixture/setup.bash,
you must not define `setup_file` function in .bats file.
You can define `_setup_file` function, which work same to origin `setup_file`.

### _setup

Due to the `setup` function is defined in tests/fixture/setup.bash,
you must not define `setup` function in .bats file.
You can define `_setup` function, which work same to origin `setup`.

### run

**Notice**: With `run <cmd>`, the commands will run in subshell. So commands which modifing variables will have no effect.

For example, this case will fail.

```sh
@test "l.read_array out < <(printf 'a\nb\nc\n')" {
  local out=()
  run l.read_array out < <(printf 'a\nb\nc\n')
  # The "out" is still empty arry
  assert_success
  assert_output ''
  assert_equal "${#out[@]}" 3
  assert_equal "${out[0]}" a
  assert_equal "${out[1]}" b
  assert_equal "${out[2]}" c
}
```

This case will pass.

```sh
@test "l.read_array out < <(printf 'a\nb\nc\n')" {
  local out=()
  l.read_array out < <(printf 'a\nb\nc\n')
  assert_equal $? 0
  assert_equal "${#out[@]}" 3
  assert_equal "${out[0]}" a
  assert_equal "${out[1]}" b
  assert_equal "${out[2]}" c
}
```

## Debug while testing

Some tricks to debug while testing.

### LOBASH_DEBUG

Set environment variable `LOBASH_DEBUG=true` to print verbose logs.

### /dev/tty

The outputs to stdout (`>&1`) and stderr (`>&2`) are catched by bats.

You could use `echo "message" >/dev/tty` to print texts to screen for debug.
