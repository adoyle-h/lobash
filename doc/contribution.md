# Contribution

## Toc

<!-- MarkdownTOC GFM -->

- [First Read](#first-read)
- [Write a module](#write-a-module)
    - [Module template](#module-template)
- [Write test cases](#write-test-cases)
    - [Test Checklist](#test-checklist)
- [Run test](#run-test)
- [Make a Pull Request](#make-a-pull-request)

<!-- /MarkdownTOC -->

## First Read

Read below links before making any contributions.

- Each contributor should sign CLA before pull request.
- [Code Styles](./code-styles.md)
- [How to write a function](./how-to-write-a-function.md)

## Write a module

**One module must have only one public function.**

Suppose that you will implement a module which named `hello_world`.
Create a file at `src/modules/hello_world.bash`.
The module name suggests to start with a verb.

Public method name must be prefixed with `l.` and written in below format,

```sh
l.hello_world() {
}
```

If private method needed, the name of private method must be prefixed with `_l.` and written in below format,

```sh
_l.private_function() {
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

Module test cases must be put in `test/` folder.
The file path of test case must be corresponding with source file path. For example, `src/modules/ask.bash` to `test/modules/ask.bats`; `src/import.bash` to `test/import.bats`.

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

### Test Checklist

- [ ] assert success
- [ ] assert failure
- [ ] check exit code
- [ ] check stdout printed
- [ ] check stderr printed

## Run test

`./run_test` or `./run_test <path-to-test-file-or-directory>`.

## Make a Pull Request

All PRs should follow below conditions.

-[ ] One module one public function.
-[ ] Code style lint pass.
-[ ] Test cases without errors and skips.
-[ ] Squash one Git commit per PR.
-[ ] Git message is [valid](./git-message.md).
-[ ] Run `./bin/check_module <path-to-your-module>` without error.
