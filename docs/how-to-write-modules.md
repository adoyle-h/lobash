# How to write modules

## Write a module

### Module path

The module path must match the regexp `src/modules/[_a-zA-Z0-9]+\.bash`

It is suggested to the module name should start with a verb.

### Function and constant name prefix keywords

- `l.` public method
- `L_` public constant
- `_l.` private method
- `_L_` private constant
- `_lobash.` internal method
- `_LOBASH_` internal constant
- `l_` function local variable

**One module must have only one public function.**

For examples, suppose that you will implement a module which named `hello_world`.

Public method must naming prefixed with `l.` and written in below format,

```sh
l.hello_world() {
  printf '%s\n' 'hello world'
}
```

Private method must naming prefixed with `_l.` and written in below format,

```sh
_l.private_function() {
  printf '%s\n' 'xxx'
}
```

### Module template

```sh
# ---
# Category: XXX
# ---

l.public_function() {
}
```

Each module must have these comments which called Metadata at top.

See the [Module Metadata](./module-metadata.md) document for detail.

## Write test cases

Module test cases must be put in `tests/` folder.
The file path of test case must be corresponding with source file path. For example, `src/modules/ask.bash` to `tests/modules/ask.bats`.

It is based on [bats-core](https://github.com/bats-core/bats-core).

For examples,

```sh
#!/usr/bin/env bats

setup_fixture
load_module l.trim

@test "l.trim_start '  hah'" {
  run l.trim_start '  hah'
  assert_success
  assert_output "hah"
}

@test "l.trim_start 'hah'" {
  run l.trim_start 'hah'
  assert_success
  assert_output "hah"
}
```

You can use many assert helper functions such as `assert_success`, `assert_output` and `assert_equal` which supported by [bats-assert](https://github.com/jasonkarns/bats-assert-1).

### Test checklist

- [ ] assert success
- [ ] assert failure
- [ ] check exit code
- [ ] check stdout printed
- [ ] check stderr printed

## Run test

`./test` or `./test ./tests/modules/${module_name}.bats`.

## Internal Module

See [./internal-modules.md](./internal-modules.md).

## Forbidden export

export any variables and functions are forbidden.
