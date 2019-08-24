# Category: Array

[⬅️ Back to previous page](./README.md)

## TOC

- [array_include](#array_include)
- [array_include.s](#array_include.s)
- [first](#first)
- [last](#last)
- [sort](#sort)
- [union_array](#union_array)

## Modules

### array_include

- Usage: `l.array_include <array_name> <match>`
- Description: Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.3.1
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/array_include.bats](../../tests/modules/array_include.bats)
- Source Code: [src/modules/array_include.bash](../../src/modules/array_include.bash)

### array_include.s

- Usage: `l.array_include.s <array_name> <match>`
- Description: This function always echo `true` or `false` and exit code always be 0.
- Since: 0.3.1
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/array_include.s.bats](../../tests/modules/array_include.s.bats)
- Source Code: [src/modules/array_include.s.bash](../../src/modules/array_include.s.bash)

### first

- Usage: `l.first <array_name>`
- Description: Return the first value of array.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/first.bats](../../tests/modules/first.bats)
- Source Code: [src/modules/first.bash](../../src/modules/first.bash)

### last

- Usage: `l.last <array_name>`
- Description: Return the last value of array.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/last.bats](../../tests/modules/last.bats)
- Source Code: [src/modules/last.bash](../../src/modules/last.bash)

### sort

- Usage: `l.sort <array_name> [<sort-opts>]...`
- Description:
  - Print a new sorted array with linux "sort" command.
  - The `<sort-opts>` are options of "sort" command.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/sort.bats](../../tests/modules/sort.bats)
- Source Code: [src/modules/sort.bash](../../src/modules/sort.bash)
- Executable Example: [example/modules/sort](../../example/modules/sort)

### union_array

- Usage: `l.union_array <array_name_1> [<array_name_2>]`
- Description: Create an array of unique values from all given arrays.
- Dependent: [`echo_array`](./console.md#echo_array)
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/union_array.bats](../../tests/modules/union_array.bats)
- Source Code: [src/modules/union_array.bash](../../src/modules/union_array.bash)

[⬆️ Back up to TOC](#toc)
