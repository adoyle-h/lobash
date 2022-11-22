# Category: Condition

[⬅️ Back to previous page](./README.md)

## TOC

- [end_with](#end_with)
- [end_with.s](#end_with.s)
- [has](#has)
- [has.s](#has.s)
- [has_not](#has_not)
- [has_not.s](#has_not.s)
- [if](#if)
- [is_array](#is_array)
- [is_array.s](#is_array.s)
- [is_bash](#is_bash)
- [is_bash.s](#is_bash.s)
- [is_dir](#is_dir)
- [is_dir.s](#is_dir.s)
- [is_executable](#is_executable)
- [is_executable.s](#is_executable.s)
- [is_executable_file](#is_executable_file)
- [is_executable_file.s](#is_executable_file.s)
- [is_exported](#is_exported)
- [is_falsy](#is_falsy)
- [is_falsy.s](#is_falsy.s)
- [is_file](#is_file)
- [is_file.s](#is_file.s)
- [is_float](#is_float)
- [is_float.s](#is_float.s)
- [is_function](#is_function)
- [is_function.s](#is_function.s)
- [is_gnu_sed](#is_gnu_sed)
- [is_integer](#is_integer)
- [is_integer.s](#is_integer.s)
- [is_link](#is_link)
- [is_link.s](#is_link.s)
- [is_number](#is_number)
- [is_number.s](#is_number.s)
- [is_readable](#is_readable)
- [is_readable.s](#is_readable.s)
- [is_truthy](#is_truthy)
- [is_truthy.s](#is_truthy.s)
- [is_tty_available](#is_tty_available)
- [is_tty_available.s](#is_tty_available.s)
- [is_ubuntu](#is_ubuntu)
- [is_undefined](#is_undefined)
- [is_writable](#is_writable)
- [is_writable.s](#is_writable.s)
- [not.s](#not.s)
- [not.s.p](#not.s.p)
- [start_with](#start_with)
- [start_with.s](#start_with.s)
- [str_include](#str_include)
- [str_include.s](#str_include.s)

## Modules

### end_with

- Usage: `l.end_with <string> <match>`
- Description: Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.3.1
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/end_with.bats](../../tests/modules/end_with.bats)
- Source Code: [src/modules/end_with.bash](../../src/modules/end_with.bash)

### end_with.s

- Usage: `l.end_with.s <string> <match>`
- Description: This function always echo `true` or `false` and exit code always be 0.
- Dependent: [`end_with`](./condition.md#end_with)
- Since: 0.3.1
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/end_with.s.bats](../../tests/modules/end_with.s.bats)
- Source Code: [src/modules/end_with.s.bash](../../src/modules/end_with.s.bash)

### has

- Usage: `l.has <condition> <what>`
- Description:
  - Exit with 0 or 1. Check if command/function/alias/keyword/builtin or anything existed.
  - `<condition>` Valid value: `command`, `function`, `alias`, `keyword`, `builtin`, `the`
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/has.bats](../../tests/modules/has.bats)
- Source Code: [src/modules/has.bash](../../src/modules/has.bash)

### has.s

- Usage: `l.has.s <condition> <what>`
- Description:
  - Echo `true` or `false` to indicate that command/function/alias/keyword/builtin or anything existed.
  - `<condition>` Valid value: `command`, `function`, `alias`, `keyword`, `builtin`, `the`
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/has.s.bats](../../tests/modules/has.s.bats)
- Source Code: [src/modules/has.s.bash](../../src/modules/has.s.bash)

### has_not

- Usage: `l.has_not <condition> <what>`
- Description: Opposite to l.has
- Dependent: [`has`](./condition.md#has)
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/has_not.bats](../../tests/modules/has_not.bats)
- Source Code: [src/modules/has_not.bash](../../src/modules/has_not.bash)

### has_not.s

- Usage: `l.has_not.s <condition> <what>`
- Description: Opposite to l.has.s
- Dependent: [`has.s`](./condition.md#has.s) [`not.s`](./condition.md#not.s)
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/has_not.s.bats](../../tests/modules/has_not.s.bats)
- Source Code: [src/modules/has_not.s.bash](../../src/modules/has_not.s.bash)

### if

- Usage: `l.if <condition> <then> [<else>]`
- Description:
  - The difference from shell builtin `if` is when condition function throw exception it will ended immediately.
  - `<condition>` can be function name, string and number. The function should return `true`/`0` or `false`/`1`.
  - `<then>` and `<else>` must be function name. And `<else>` is optional.
  - When `<condition>` is true, `<then>` function will be invoked. Otherwise `<else>` will be invoked if it passed.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/if.bats](../../tests/modules/if.bats)
- Source Code: [src/modules/if.bash](../../src/modules/if.bash)

### is_array

- Usage: `l.is_array <var_name>`
- Description: When the variable is array or associative array, it returns 0 (true). Otherwise it returns 1 (false). This function should never throw exception error.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- **Notice**:
  - **Only with bash 4.3, this function return 1 when the variable declared without initialization.**
  - **Because `declare -p a` shows `declare: a: not found` when `declare -a a`. It's a bug in bash 4.3.**
- Test Cases: [tests/modules/is_array.bats](../../tests/modules/is_array.bats)
- Source Code: [src/modules/is_array.bash](../../src/modules/is_array.bash)

### is_array.s

- Usage: `l.is_array.s <var_name>`
- Description: When the variable is array or associative array, it prints `true`. Otherwise it prints `false`. And it always exit with code 0.
- Dependent: [`is_array`](./condition.md#is_array)
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- **Notice**:
  - **Only with bash 4.3, this function will echo `false` when the variable declared without initialization.**
  - **Because `declare -p a` shows `declare: a: not found` when `declare -a a`. It's a bug in bash 4.3.**
- Test Cases: [tests/modules/is_array.s.bats](../../tests/modules/is_array.s.bats)
- Source Code: [src/modules/is_array.s.bash](../../src/modules/is_array.s.bash)

### is_bash

- Usage: `l.is_bash`
- Description: Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_bash.bats](../../tests/modules/is_bash.bats)
- Source Code: [src/modules/is_bash.bash](../../src/modules/is_bash.bash)

### is_bash.s

- Usage: `l.is_bash.s`
- Description: This function always echo `true` or `false` and exit code always be 0.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_bash.s.bats](../../tests/modules/is_bash.s.bats)
- Source Code: [src/modules/is_bash.s.bash](../../src/modules/is_bash.s.bash)

### is_dir

- Usage: `l.is_dir <path>`
- Description:
  - Detect `<path>` is whether a directory or not.
  - Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_dir.bats](../../tests/modules/is_dir.bats)
- Source Code: [src/modules/is_dir.bash](../../src/modules/is_dir.bash)

### is_dir.s

- Usage: `l.is_dir.s <path>`
- Description:
  - Detect `<path>` is whether a directory or not.
  - This function always echo `true` or `false` and exit code always be 0.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_dir.s.bats](../../tests/modules/is_dir.s.bats)
- Source Code: [src/modules/is_dir.s.bash](../../src/modules/is_dir.s.bash)

### is_executable

- Usage: `l.is_executable <path>`
- Description:
  - Similar to `[[ -x ]]`.
  - Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_executable.bats](../../tests/modules/is_executable.bats)
- Source Code: [src/modules/is_executable.bash](../../src/modules/is_executable.bash)

### is_executable.s

- Usage: `l.is_executable.s <path>`
- Description:
  - Similar to `[[ -x ]]`
  - This function always echo `true` or `false` and exit code always be 0.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_executable.s.bats](../../tests/modules/is_executable.s.bats)
- Source Code: [src/modules/is_executable.s.bash](../../src/modules/is_executable.s.bash)

### is_executable_file

- Usage: `l.is_executable_file <path>`
- Description:
  - Similar to `l.is_executable`. But if `<path>` is directory it will return false.
  - Return 0 (true) or 1 (false). This function should never throw exception error.
- Dependent: [`is_dir`](./condition.md#is_dir)
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_executable_file.bats](../../tests/modules/is_executable_file.bats)
- Source Code: [src/modules/is_executable_file.bash](../../src/modules/is_executable_file.bash)

### is_executable_file.s

- Usage: `l.is_executable_file.s <path>`
- Description:
  - Similar to `l.is_executable`. But if `<path>` is directory it will return false.
  - This function always echo `true` or `false` and exit code always be 0.
- Dependent: [`is_executable_file`](./condition.md#is_executable_file)
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_executable_file.s.bats](../../tests/modules/is_executable_file.s.bats)
- Source Code: [src/modules/is_executable_file.s.bash](../../src/modules/is_executable_file.s.bash)

### is_exported

- Usage: `l.is_exported <var_name>`
- Description:
  - Check whether a shell variable is exported.
  - Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.5.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_exported.bats](../../tests/modules/is_exported.bats)
- Source Code: [src/modules/is_exported.bash](../../src/modules/is_exported.bash)

### is_falsy

- Usage: `l.is_falsy <var>`
- Description:
  - nonzero number and string "false" should be falsy.
  - Return 0 (true) or 1 (false). This function should never throw exception error.
- Dependent: [`is_integer`](./condition.md#is_integer)
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_falsy.bats](../../tests/modules/is_falsy.bats)
- Source Code: [src/modules/is_falsy.bash](../../src/modules/is_falsy.bash)

### is_falsy.s

- Usage: `l.is_falsy.s <var>`
- Description:
  - nonzero number and string "false" should be falsy.
  - This function always echo `true` or `false` and exit code always be 0.
- Dependent: [`is_falsy`](./condition.md#is_falsy)
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_falsy.s.bats](../../tests/modules/is_falsy.s.bats)
- Source Code: [src/modules/is_falsy.s.bash](../../src/modules/is_falsy.s.bash)

### is_file

- Usage: `l.is_file <path>`
- Description: Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_file.bats](../../tests/modules/is_file.bats)
- Source Code: [src/modules/is_file.bash](../../src/modules/is_file.bash)

### is_file.s

- Usage: `l.is_file.s <path>`
- Description: This function always echo `true` or `false` and exit code always be 0.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_file.s.bats](../../tests/modules/is_file.s.bats)
- Source Code: [src/modules/is_file.s.bash](../../src/modules/is_file.s.bash)

### is_float

- Usage: `l.is_float <str>`
- Description: Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_float.bats](../../tests/modules/is_float.bats)
- Source Code: [src/modules/is_float.bash](../../src/modules/is_float.bash)

### is_float.s

- Usage: `l.is_float.s <str>`
- Description: This function always echo `true` or `false` and exit code always be 0.
- Dependent: [`is_float`](./condition.md#is_float)
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_float.s.bats](../../tests/modules/is_float.s.bats)
- Source Code: [src/modules/is_float.s.bash](../../src/modules/is_float.s.bash)

### is_function

- Usage: `l.is_function <var_name>`
- Description: Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.5.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_function.bats](../../tests/modules/is_function.bats)
- Source Code: [src/modules/is_function.bash](../../src/modules/is_function.bash)

### is_function.s

- Usage: `l.is_function.s <var_name>`
- Description:
  - Detect `<var_name>` is whether a function or not.
  - This function always echo `true` or `false` and exit code always be 0.
- Since: 0.5.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_function.s.bats](../../tests/modules/is_function.s.bats)
- Source Code: [src/modules/is_function.s.bash](../../src/modules/is_function.s.bash)

### is_gnu_sed

- Usage: `l.is_gnu_sed`
- Description: Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.5.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_gnu_sed.bats](../../tests/modules/is_gnu_sed.bats)
- Source Code: [src/modules/is_gnu_sed.bash](../../src/modules/is_gnu_sed.bash)

### is_integer

- Usage: `l.is_integer <str>`
- Description: Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_integer.bats](../../tests/modules/is_integer.bats)
- Source Code: [src/modules/is_integer.bash](../../src/modules/is_integer.bash)

### is_integer.s

- Usage: `l.is_integer.s <str>`
- Description: This function always echo `true` or `false` and exit code always be 0.
- Dependent: [`is_integer`](./condition.md#is_integer)
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_integer.s.bats](../../tests/modules/is_integer.s.bats)
- Source Code: [src/modules/is_integer.s.bash](../../src/modules/is_integer.s.bash)

### is_link

- Usage: `l.is_link <path>`
- Description: Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_link.bats](../../tests/modules/is_link.bats)
- Source Code: [src/modules/is_link.bash](../../src/modules/is_link.bash)

### is_link.s

- Usage: `l.is_link.s <path>`
- Description: This function always echo `true` or `false` and exit code always be 0.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_link.s.bats](../../tests/modules/is_link.s.bats)
- Source Code: [src/modules/is_link.s.bash](../../src/modules/is_link.s.bash)

### is_number

- Usage: `l.is_number <str>`
- Description: Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_number.bats](../../tests/modules/is_number.bats)
- Source Code: [src/modules/is_number.bash](../../src/modules/is_number.bash)

### is_number.s

- Usage: `l.is_number.s <str>`
- Description: This function always echo `true` or `false` and exit code always be 0.
- Dependent: [`is_number`](./condition.md#is_number)
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_number.s.bats](../../tests/modules/is_number.s.bats)
- Source Code: [src/modules/is_number.s.bash](../../src/modules/is_number.s.bash)

### is_readable

- Usage: `l.is_readable <path>`
- Description: Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_readable.bats](../../tests/modules/is_readable.bats)
- Source Code: [src/modules/is_readable.bash](../../src/modules/is_readable.bash)

### is_readable.s

- Usage: `l.is_readable.s <path>`
- Description: This function always echo `true` or `false` and exit code always be 0.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_readable.s.bats](../../tests/modules/is_readable.s.bats)
- Source Code: [src/modules/is_readable.s.bash](../../src/modules/is_readable.s.bash)

### is_truthy

- Usage: `l.is_truthy <str>`
- Description:
  - zero number and string "true" should be truthy.
  - Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_truthy.bats](../../tests/modules/is_truthy.bats)
- Source Code: [src/modules/is_truthy.bash](../../src/modules/is_truthy.bash)

### is_truthy.s

- Usage: `l.is_truthy.s <str>`
- Description:
  - zero number and string "true" should be truthy.
  - This function always echo `true` or `false` and exit code always be 0.
- Dependent: [`is_truthy`](./condition.md#is_truthy)
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_truthy.s.bats](../../tests/modules/is_truthy.s.bats)
- Source Code: [src/modules/is_truthy.s.bash](../../src/modules/is_truthy.s.bash)

### is_tty_available

- Usage: `l.is_tty_available`
- Description: Whether /dev/tty is available
- Since: 0.5.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_tty_available.bats](../../tests/modules/is_tty_available.bats)
- Source Code: [src/modules/is_tty_available.bash](../../src/modules/is_tty_available.bash)

### is_tty_available.s

- Usage: `l.is_tty_available.s`
- Description:
  - Whether /dev/tty is available
  - This function always echo `true` or `false` and exit code always be 0.
- Since: 0.5.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_tty_available.s.bats](../../tests/modules/is_tty_available.s.bats)
- Source Code: [src/modules/is_tty_available.s.bash](../../src/modules/is_tty_available.s.bash)

### is_ubuntu

- Usage: `l.is_ubuntu`
- Description:
  - Detect whether current os is Ubuntu or not.
  - Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.5.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_ubuntu.bats](../../tests/modules/is_ubuntu.bats)
- Source Code: [src/modules/is_ubuntu.bash](../../src/modules/is_ubuntu.bash)

### is_undefined

- Usage: `l.is_undefined <var_name>`
- Description:
  - Check whether a shell variable is undefined.
  - Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.5.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_undefined.bats](../../tests/modules/is_undefined.bats)
- Source Code: [src/modules/is_undefined.bash](../../src/modules/is_undefined.bash)

### is_writable

- Usage: `l.is_writable <path>`
- Description: Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_writable.bats](../../tests/modules/is_writable.bats)
- Source Code: [src/modules/is_writable.bash](../../src/modules/is_writable.bash)

### is_writable.s

- Usage: `l.is_writable.s <path>`
- Description: This function always echo `true` or `false` and exit code always be 0.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/is_writable.s.bats](../../tests/modules/is_writable.s.bats)
- Source Code: [src/modules/is_writable.s.bash](../../src/modules/is_writable.s.bash)

### not.s

- Usage: `l.not.s <condition>`
- Description: `<condition>` must be `true` or `false`. This function returns the opposite value.
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/not.s.bats](../../tests/modules/not.s.bats)
- Source Code: [src/modules/not.s.bash](../../src/modules/not.s.bash)

### not.s.p

- Usage: `echo <condition> | l.not.s.p`
- Description: The pipeline version of l.not
- Dependent: [`not.s`](./condition.md#not.s)
- Since: 0.3.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/not.s.p.bats](../../tests/modules/not.s.p.bats)
- Source Code: [src/modules/not.s.p.bash](../../src/modules/not.s.p.bash)

### start_with

- Usage: `l.start_with <string> <match>`
- Description:
  - Check if a string starts with given match string.
  - Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.3.1
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/start_with.bats](../../tests/modules/start_with.bats)
- Source Code: [src/modules/start_with.bash](../../src/modules/start_with.bash)

### start_with.s

- Usage: `l.start_with.s <string> <match>`
- Description:
  - Check if a string starts with given match string.
  - This function always echo `true` or `false` and exit code always be 0.
- Dependent: [`start_with`](./condition.md#start_with)
- Since: 0.3.1
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/start_with.s.bats](../../tests/modules/start_with.s.bats)
- Source Code: [src/modules/start_with.s.bash](../../src/modules/start_with.s.bash)

### str_include

- Usage: `l.str_include <string> <sub-string>`
- Description: Return `true` or `false`. Check if a string includes given match string.
- Since: 0.3.1
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/str_include.bats](../../tests/modules/str_include.bats)
- Source Code: [src/modules/str_include.bash](../../src/modules/str_include.bash)

### str_include.s

- Usage: `l.str_include.s <string> <sub-string>`
- Description: Return `true` or `false`. Check if a string includes given match string.
- Dependent: [`str_include`](./condition.md#str_include)
- Since: 0.3.1
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/str_include.s.bats](../../tests/modules/str_include.s.bats)
- Source Code: [src/modules/str_include.s.bash](../../src/modules/str_include.s.bash)

[⬆️ Back up to TOC](#toc)
