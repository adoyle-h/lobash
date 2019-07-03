# Category: Condition

[⬅️ Back to previous page](./README.md)

## TOC

- [has](#has)
- [if](#if)
- [is_array](#is_array)
- [is_bash](#is_bash)
- [is_dir](#is_dir)
- [is_executable](#is_executable)
- [is_executable_file](#is_executable_file)
- [is_false](#is_false)
- [is_file](#is_file)
- [is_float](#is_float)
- [is_integer](#is_integer)
- [is_link](#is_link)
- [is_number](#is_number)
- [is_readable](#is_readable)
- [is_true](#is_true)
- [is_writeable](#is_writeable)
- [is_zsh](#is_zsh)
- [not](#not)
- [not.p](#not.p)
- [strict_has](#strict_has)
- [strict_has_not](#strict_has_not)

## Modules

### has

- Usage:
  - `l.has <condition> <what>`
  - `l.has not <condition> <what>`
- Description:
  - Exit with 0 or 1. Check if command/function/alias/keyword/builtin or anything existed.
  - `<condition>` Valid value: `command`, `function`, `alias`, `keyword`, `builtin`, `the`
  - This method is not recommended. Use strict_has instead.
- Since: 0.1.0
- Test Cases: [tests/modules/has.bats](../../tests/modules/has.bats)
- Source Code: [src/modules/has.bash](../../src/modules/has.bash)

### if

- Usage: `l.if <condition> <then> [<else>]`
- Description:
  - The difference from shell builtin `if` is when condition function throw exception it will ended immediately.
  - `<condition>` can be function name, string and number. The function should return `true`/`0` or `false`/`1`.
  - `<then>` and `<else>` must be function name. And `<else>` is optional.
  - When `<condition>` is true, `<then>` function will be invoked. Otherwise `<else>` will be invoked if it passed.
- Since: 0.1.0
- Test Cases: [tests/modules/if.bats](../../tests/modules/if.bats)
- Source Code: [src/modules/if.bash](../../src/modules/if.bash)

### is_array

- Usage: `l.is_array <var_name>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- Test Cases: [tests/modules/is_array.bats](../../tests/modules/is_array.bats)
- Source Code: [src/modules/is_array.bash](../../src/modules/is_array.bash)

### is_bash

- Usage: `l.is_bash`
- Description: Return `true` or `false`.
- Since: 0.1.0
- Test Cases: [tests/modules/is_bash.bats](../../tests/modules/is_bash.bats)
- Source Code: [src/modules/is_bash.bash](../../src/modules/is_bash.bash)

### is_dir

- Usage: `l.is_dir <path>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- Test Cases: [tests/modules/is_dir.bats](../../tests/modules/is_dir.bats)
- Source Code: [src/modules/is_dir.bash](../../src/modules/is_dir.bash)

### is_executable

- Usage: `l.is_executable <path>`
- Description: Similar to `[[ -x ]]`. Return `true` or `false`.
- Since: 0.1.0
- Test Cases: [tests/modules/is_executable.bats](../../tests/modules/is_executable.bats)
- Source Code: [src/modules/is_executable.bash](../../src/modules/is_executable.bash)

### is_executable_file

- Usage: `l.is_executable_file <path>`
- Description: Similar to `l.is_executable`. But if `<path>` is directory it will return false.
- Dependent: [`is_dir`](./condition.md#is_dir)
- Since: 0.1.0
- Test Cases: [tests/modules/is_executable_file.bats](../../tests/modules/is_executable_file.bats)
- Source Code: [src/modules/is_executable_file.bash](../../src/modules/is_executable_file.bash)

### is_false

- Usage: `l.is_false <var>`
- Description: Return `true` or `false`.
- Dependent: [`is_integer`](./condition.md#is_integer)
- Since: 0.1.0
- Test Cases: [tests/modules/is_false.bats](../../tests/modules/is_false.bats)
- Source Code: [src/modules/is_false.bash](../../src/modules/is_false.bash)

### is_file

- Usage: `l.is_file <path>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- Test Cases: [tests/modules/is_file.bats](../../tests/modules/is_file.bats)
- Source Code: [src/modules/is_file.bash](../../src/modules/is_file.bash)

### is_float

- Usage: `l.is_float <str>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- Test Cases: [tests/modules/is_float.bats](../../tests/modules/is_float.bats)
- Source Code: [src/modules/is_float.bash](../../src/modules/is_float.bash)

### is_integer

- Usage: `l.is_integer <str>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- Test Cases: [tests/modules/is_integer.bats](../../tests/modules/is_integer.bats)
- Source Code: [src/modules/is_integer.bash](../../src/modules/is_integer.bash)

### is_link

- Usage: `l.is_link <path>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- Test Cases: [tests/modules/is_link.bats](../../tests/modules/is_link.bats)
- Source Code: [src/modules/is_link.bash](../../src/modules/is_link.bash)

### is_number

- Usage: `l.is_number <str>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- Test Cases: [tests/modules/is_number.bats](../../tests/modules/is_number.bats)
- Source Code: [src/modules/is_number.bash](../../src/modules/is_number.bash)

### is_readable

- Usage: `l.is_readable <path>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- Test Cases: [tests/modules/is_readable.bats](../../tests/modules/is_readable.bats)
- Source Code: [src/modules/is_readable.bash](../../src/modules/is_readable.bash)

### is_true

- Usage: `l.is_true <str>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- Test Cases: [tests/modules/is_true.bats](../../tests/modules/is_true.bats)
- Source Code: [src/modules/is_true.bash](../../src/modules/is_true.bash)

### is_writeable

- Usage: `l.is_writeable <path>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- Test Cases: [tests/modules/is_writeable.bats](../../tests/modules/is_writeable.bats)
- Source Code: [src/modules/is_writeable.bash](../../src/modules/is_writeable.bash)

### is_zsh

- Usage: `l.is_zsh`
- Description: Return `true` or `false`.
- Since: 0.1.0
- Test Cases: [tests/modules/is_zsh.bats](../../tests/modules/is_zsh.bats)
- Source Code: [src/modules/is_zsh.bash](../../src/modules/is_zsh.bash)

### not

- Usage: `l.not <condition>`
- Description: `<condition>` must be `true` or `false`. This function returns the opposite value.
- Since: 0.1.0
- Test Cases: [tests/modules/not.bats](../../tests/modules/not.bats)
- Source Code: [src/modules/not.bash](../../src/modules/not.bash)

### not.p

- Usage: `echo <condition> | l.not.p`
- Description: The pipeline version of l.not
- Dependent: [`not`](./condition.md#not)
- Since: 0.1.0
- Test Cases: [tests/modules/not.p.bats](../../tests/modules/not.p.bats)
- Source Code: [src/modules/not.p.bash](../../src/modules/not.p.bash)

### strict_has

- Usage: `l.strict_has <condition> <what>`
- Description:
  - Return `true` or `false`. Check if command/function/alias/keyword/builtin or anything existed.
  - `<condition>` Valid value: `command`, `function`, `alias`, `keyword`, `builtin`, `the`
- Since: 0.1.0
- Test Cases: [tests/modules/strict_has.bats](../../tests/modules/strict_has.bats)
- Source Code: [src/modules/strict_has.bash](../../src/modules/strict_has.bash)

### strict_has_not

- Usage: `strict_has_not <condition> <what>`
- Description: Opposite to strict_has.
- Dependent: [`strict_has`](./condition.md#strict_has) [`not`](./condition.md#not)
- Since: 0.1.0
- Test Cases: [tests/modules/strict_has_not.bats](../../tests/modules/strict_has_not.bats)
- Source Code: [src/modules/strict_has_not.bash](../../src/modules/strict_has_not.bash)

[⬆️ Back up to TOC](#toc)
