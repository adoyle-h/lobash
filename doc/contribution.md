# Contribution

Read the [Code Styles](./code-styles.md) before making any contributions.

## Write a module

Filename must follow the path `src/modules/xxx.bash`.

Public method must be written in below format,

```bash
public_function() {
}
```

Private method name must be prefixed with `_`. Like this,

```bash
_private_function() {
}
```

### Write test cases

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
