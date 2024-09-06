# Category: Array

[⬅️ Back to previous page](./README.md)

## TOC

- [array_has_key](#array_has_key)
- [array_include](#array_include)
- [array_include.s](#array_includes)
- [array_reverse](#array_reverse)
- [array_size](#array_size)
- [each](#each)
- [each.p](#eachp)
- [first](#first)
- [head](#head)
- [keys](#keys)
- [last](#last)
- [read_array](#read_array)
- [seq](#seq)
- [sort](#sort)
- [union_array](#union_array)

## Modules

### array_has_key

- Usage: `l.array_has_key <array_name> <key_name>`
- Description:
  - Check key whether defined in array or associative array.
  - Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.7.0
- Bash: 4.0+
- Test Cases: [tests/modules/array_has_key.bats](../../tests/modules/array_has_key.bats)
- Source Code: [src/modules/array_has_key.bash](../../src/modules/array_has_key.bash)

### array_include

- Usage: `l.array_include <array_name> <match>`
- Description: Return 0 (true) or 1 (false). This function should never throw exception error.
- Since: 0.3.1
- Bash: 4.0+
- Test Cases: [tests/modules/array_include.bats](../../tests/modules/array_include.bats)
- Source Code: [src/modules/array_include.bash](../../src/modules/array_include.bash)

### array_include.s

- Usage: `l.array_include.s <array_name> <match>`
- Description: This function always echo `true` or `false` and exit code always be 0.
- Since: 0.3.1
- Bash: 4.0+
- Test Cases: [tests/modules/array_include.s.bats](../../tests/modules/array_include.s.bats)
- Source Code: [src/modules/array_include.s.bash](../../src/modules/array_include.s.bash)

### array_reverse

- Usage:
  - `l.array_reverse <input_array_name> <output_array_name>`
  - `l.read_array <output_array_name> < <(l.array_reverse <input_array_name>)`
- Description:
  - Reverse array `<input_array_name>`.
  - If `<output_array_name>` set, store the reversed results in `<output_array_name>`.
  - Otherwise, print the reversed results to stdout.
  - You can use `l.read_array out < <(l.array_reverse <input_array_name>)` to read array.
- Since: 0.6.0
- Bash: 4.0+
- **Notice**:
  - **When in subshell, you must call `l.array_reverse <input_array_name>`.**
  - **The `l.array_reverse <input_array_name> <output_array_name>` not works in subshell.**
- Test Cases: [tests/modules/array_reverse.bats](../../tests/modules/array_reverse.bats)
- Source Code: [src/modules/array_reverse.bash](../../src/modules/array_reverse.bash)

### array_size

- Usage: `l.array_size <array_name>`
- Description:
  - Return the actual size of array and associative array
  - For `declare -A array=([test]='')`, the `${#array[@]}` is 0, because bash excludes the null value.
- Since: 0.7.0
- Bash: 4.0+
- Test Cases: [tests/modules/array_size.bats](../../tests/modules/array_size.bats)
- Source Code: [src/modules/array_size.bash](../../src/modules/array_size.bash)

### each

- Usage:
  - `l.each <array> <fn>`
  - `l.read_array out < <(l.each <array> <fn>)`
- Description:
  - Iterates over elements of array and invokes function for each element.
  - The function is invoked with two arguments: (value, index|key).
  - `<array>` must be the array name. `<fn>` must be the function name.
  - You can use `l.read_array` to create an array with l.each while `<fn>` printing new value.
  - l.each can be used for map/filter/count/find.
- Since: 0.6.0
- Bash: 4.0+
- **Notice**: **For associative array, the order of keys is uncertain.**
- Test Cases: [tests/modules/each.bats](../../tests/modules/each.bats)
- Source Code: [src/modules/each.bash](../../src/modules/each.bash)

### each.p

- Usage: `printf '1\n2\n' | l.each.p <fn>`
- Description:
  - Iterates over elements from pipe and invokes function with each element.
  - The function is invoked with two arguments: (value, index).
  - `<fn>` must be the function name.
- Since: 0.6.0
- Bash: 4.0+
- Test Cases: [tests/modules/each.p.bats](../../tests/modules/each.p.bats)
- Source Code: [src/modules/each.p.bash](../../src/modules/each.p.bash)

### first

- Usage: `l.first <array_name> [<count>=1]`
- Description: Return the first values of array.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/first.bats](../../tests/modules/first.bats)
- Source Code: [src/modules/first.bash](../../src/modules/first.bash)

### head

- Usage: `l.head <count> < "file"`
- Description: Display first lines from pipe
- Since: 0.6.0
- Bash: 4.0+
- Test Cases: [tests/modules/head.bats](../../tests/modules/head.bats)
- Source Code: [src/modules/head.bash](../../src/modules/head.bash)

### keys

- Usage: `l.keys <array_name>`
- Description: List all keys of array or associative array.
- Since: 0.5.0
- Bash: 4.0+
- **Notice**: **For associative array, the order of keys is uncertain.**
- Test Cases: [tests/modules/keys.bats](../../tests/modules/keys.bats)
- Source Code: [src/modules/keys.bash](../../src/modules/keys.bash)

### last

- Usage: `l.last <array_name> [<count>=1]`
- Description: Return the last values of array.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/last.bats](../../tests/modules/last.bats)
- Source Code: [src/modules/last.bash](../../src/modules/last.bash)

### read_array

- Usage: `l.read_array <array_name> < <(printf 'a\nb\nc\n')`
- Description: Read array from pipeline (Each item must be split with `\n`). The results store in `<array_name>`.
- Since: 0.6.0
- Bash: 4.0+
- **Notice**: **Do not use `printf 'a\nb\nc\n' | l.read_array <name>`. See [this link](https://superuser.com/a/1348950) for reason.**
- Test Cases: [tests/modules/read_array.bats](../../tests/modules/read_array.bats)
- Source Code: [src/modules/read_array.bash](../../src/modules/read_array.bash)

### seq

- Usage: `l.seq <fn> <start> <end> [<step>=1]`
- Description:
  - Same to `for i in {<start>..<end>..<step>}; do <fn> "$i"; done`
  - `<step>` must be positive integer. And `<end>` can be less than `<start>`.
  - It can print zero-padded numbers. `l.seq <fn> 01 100`
- Since: 0.6.0
- Bash: 4.0+
- **Notice**: **With Bash 4.0, do not use zero-padded numbers, bash has a bug.**
- Test Cases: [tests/modules/seq.bats](../../tests/modules/seq.bats)
- Source Code: [src/modules/seq.bash](../../src/modules/seq.bash)

### sort

- Usage: `l.sort <array_name> [<sort-opts>]...`
- Description:
  - Print a new sorted array with linux "sort" command.
  - The `<sort-opts>` are options of "sort" command.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/sort.bats](../../tests/modules/sort.bats)
- Source Code: [src/modules/sort.bash](../../src/modules/sort.bash)
- Example: [example/modules/sort](../../example/modules/sort)

### union_array

- Usage: `l.union_array <array_name_1> [<array_name_2>]`
- Description: Create an array of unique values from all given arrays.
- Dependent: [`echo_array`](./console.md#echo_array)
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/union_array.bats](../../tests/modules/union_array.bats)
- Source Code: [src/modules/union_array.bash](../../src/modules/union_array.bash)

[⬆️ Back up to TOC](#toc)
