# Category: Array

[⬅️ Back to previous page](./README.md)

## TOC

- [array_include](#array_include)
- [first](#first)
- [last](#last)
- [sort](#sort)
- [union_array](#union_array)

## Modules

### array_include

- Usage: `l.array_include <array_name> <match>`
- Since: 0.1.0
- Bash: 4.3+
- Status: tested
- Test Cases: [tests/modules/array_include.bats](../../tests/modules/array_include.bats)
- Source Code: [src/modules/array_include.bash](../../src/modules/array_include.bash)

### first

- Usage: `l.first <array_name>`
- Description: Return the first value of array.
- Since: 0.1.0
- Bash: 4.3+
- Status: tested
- Test Cases: [tests/modules/first.bats](../../tests/modules/first.bats)
- Source Code: [src/modules/first.bash](../../src/modules/first.bash)

### last

- Usage: `l.last <array_name>`
- Description: Return the last value of array.
- Since: 0.1.0
- Bash: 4.3+
- Status: tested
- Test Cases: [tests/modules/last.bats](../../tests/modules/last.bats)
- Source Code: [src/modules/last.bash](../../src/modules/last.bash)

### sort

- Usage: `l.sort <array_name> [<sort-opts>]...`
- Description: Sort an array. The `<sort-opts>` are options of sort command.
- Since: 0.1.0
- Bash: 4.3+
- Status: tested
- Test Cases: [tests/modules/sort.bats](../../tests/modules/sort.bats)
- Source Code: [src/modules/sort.bash](../../src/modules/sort.bash)

### union_array

- Usage: `l.union_array <array_name>...`
- Description: Create an array of unique values from all given arrays.
- Dependent: [`echo_array`](./console.md#echo_array)
- Since: 0.1.0
- Bash: 4.3+
- Status: tested
- Test Cases: [tests/modules/union_array.bats](../../tests/modules/union_array.bats)
- Source Code: [src/modules/union_array.bash](../../src/modules/union_array.bash)

[⬆️ Back up to TOC](#toc)
