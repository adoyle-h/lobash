# Contribution

## Toc

<!-- MarkdownTOC GFM -->

- [First Read](#first-read)
- [Write a module](#write-a-module)
    - [Module template](#module-template)
- [Write test cases](#write-test-cases)
- [Run test](#run-test)
- [Make a Pull Request](#make-a-pull-request)

<!-- /MarkdownTOC -->

## First Read

Read below links before making any contributions.

- [Code Styles](./code-styles.md)
- [How to write a function](./how-to-write-a-function.md)

## Write a module

Filename must follow the path `src/modules/xxx.bash`.

**One module must have only one public function.**

Module name must start with a verb.

Public method must be written in below format,

```sh
public_function() {
}
```

Private method name must be prefixed with `_`. Like this,

```sh
_private_function() {
}
```

### Module template

```sh
# ---
# Category: XXX
# ---

public_function() {
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
load_module trim

@test "trim_start" {
  result="$(trim_start '  hah')"
  assert_equal "$result" "hah"
}

@test "trim_end" {
  result="$(trim_end 'aha  ')"
  assert_equal "$result" "aha"
}

@test "trim" {
  result="$(trim '  hahaha  ')"
  assert_equal "$result" "hahaha"
}
```

You can use many assert helper functions such as `assert` and `assert_equal` which supported by [bats-assert](https://github.com/jasonkarns/bats-assert-1).

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
